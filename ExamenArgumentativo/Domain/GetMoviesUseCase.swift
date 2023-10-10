//
//  GetMoviesUseCase.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

protocol GetMoviesUseCaseProtocol {
  func getMovies() async -> MovieAPIResponse?
}

class GetMoviesUseCase: GetMoviesUseCaseProtocol {
  static let shared = GetMoviesUseCase()
  let repository = MovieRepository.shared
  
  func getMovies() async -> MovieAPIResponse? {
    
    var movies = await repository.getMovies()
    
    for i in 0..<movies!.results.count {
      movies!.results[i].poster_path =
      "https://image.tmdb.org/t/p/original\(movies!.results[i].poster_path)"
    }
    
    return movies
  }
}
