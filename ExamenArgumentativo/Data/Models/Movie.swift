//
//  Movie.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

struct Movie: Codable, Identifiable {
  var id: Int
  var original_title: String
  var poster_path: String
  var vote_average: Float
}

struct MovieAPIResponse: Codable {
  var results: [Movie]
}
