//
//  NetworkService.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation
import Alamofire

let TOKEN = ProcessInfo.processInfo.environment["API_TOKEN"] ?? ""

protocol NetworkServiceProtocol {
  func setAuthToken(token: String)
  func getRequest<T: Codable>(url: URL) async -> T?
}

class NetworkService: NetworkServiceProtocol {
  static let shared = NetworkService()
  private let decoder = JSONDecoder()
  private var authToken = TOKEN
  
  func setAuthToken(token: String) {
    self.authToken = token
  }
  
  func getRequest<T: Codable>(url: URL) async -> T? {
    let headers: HTTPHeaders = [.authorization(bearerToken: self.authToken)]
    
    let request = AF.request(url, method: .get, headers: headers)
    let response = await request.serializingData().response
    
    switch response.result {
      
    case .success(let data):
      do {
        return try decoder.decode(T.self, from: data)
      } catch {
        debugPrint("Decoding failed...")
        debugPrint(error)
        return nil
      }
    case .failure(let error):
      debugPrint("Request failed...")
      debugPrint(error)
      return nil
    }
  }
}
