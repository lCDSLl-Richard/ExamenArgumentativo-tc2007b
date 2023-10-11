//
//  MainViewModel.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

class MainViewModel: ObservableObject {
  let useCase = GetMoviesUseCase.shared
  
  @Published var movies = [Movie]()
  
  /// Fetches the movies and stores them in the local property using the use case
  @MainActor
  func getMovies() async {
    movies = await useCase.getMovies()!.results
  }
}
