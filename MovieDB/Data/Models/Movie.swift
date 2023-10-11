//
//  Movie.swift
//  MovieDB
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import Foundation

struct Movie: Codable, Identifiable {
  var id: Int
  var original_title: String
  var poster_path: String
  var vote_average: Float
  var overview: String
  var genre_ids: [Int]
}

struct MovieAPIResponse: Codable {
  var results: [Movie]
}

struct Genre: Codable, Identifiable {
  var id: Int
  var name: String
}

struct GenreAPIResponse: Codable {
  var genres: [Genre]
}
