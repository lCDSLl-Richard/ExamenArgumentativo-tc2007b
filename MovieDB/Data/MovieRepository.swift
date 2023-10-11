//
//  MovieRepository.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

class API {
  static let base = "https://api.themoviedb.org/3/movie"
  struct Routes {
    static let movies = "/popular"
  }
}

protocol MovieRepositoryProtocol {
  /// Fetches page one of the movies API
  /// - Returns: the movie API Response containing the list of movies
  func getMovies() async -> MovieAPIResponse?
}

class MovieRepository: MovieRepositoryProtocol {
  let service = NetworkService.shared
  static let shared = MovieRepository()
  
  func getMovies() async -> MovieAPIResponse? {
    let url = URL(string: "\(API.base)\(API.Routes.movies)")!
    
    return await service.getRequest(url: url)
  }
}
