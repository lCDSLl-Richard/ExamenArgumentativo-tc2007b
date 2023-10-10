//
//  MainViewModel.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

class MainViewModel: ObservableObject {
  let repository = MovieRepository.shared
  
  @Published var movies = [Movie]()
  
  @MainActor
  func getMovies() async {
    movies = await repository.getMovies()!.results
  }
}
