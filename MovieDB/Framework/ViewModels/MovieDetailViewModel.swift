//
//  MovieDetailViewModel.swift
//  MovieDB
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
  @Published var genres = [String]()
  
  var useCase = GetMoviesUseCase.shared
  
  @MainActor
  func getGenres(genreIds: [Int]) async {
    for id in genreIds {
      genres.append(await useCase.getGenre(id: id).name)
    }
  }
}
