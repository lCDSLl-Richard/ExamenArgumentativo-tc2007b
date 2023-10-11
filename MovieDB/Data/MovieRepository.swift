//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

class API {
  static let base = "https://api.themoviedb.org/3"
  struct Routes {
    static let movies = "/movie/popular"
    static let genres = "/genre/movie/list"
  }
}

protocol MovieRepositoryProtocol {
  /// Fetches page one of the movies API
  /// - Returns: the movie API Response containing the list of movies
  func getMovies() async -> MovieAPIResponse?
  func getGenres() async -> [Genre]
}

class MovieRepository: MovieRepositoryProtocol {
  static let shared = MovieRepository()
  let service = NetworkService.shared
  private var genres = [Genre]()
  
  func getMovies() async -> MovieAPIResponse? {
    let url = URL(string: "\(API.base)\(API.Routes.movies)")!
    
    return await service.getRequest(url: url)
  }
  
  func getGenres() async -> [Genre] {
    if genres.isEmpty {
      let url = URL(string: "\(API.base)\(API.Routes.genres)")!
      if let res: GenreAPIResponse = await service.getRequest(url: url) {
        genres = res.genres
      }
    }
    
    return genres
  }
}
