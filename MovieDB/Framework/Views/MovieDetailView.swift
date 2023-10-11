//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailView: View {
  @StateObject var viewModel = MovieDetailViewModel()
  
  var movie: Movie
  
  var body: some View {
    ScrollView {
      VStack(spacing: 35) {
        WebImage(url: URL(string: movie.poster_path))
          .resizable()
          .scaledToFit()
          .frame(width: 400, height: 400)

        Text(movie.original_title)
          .font(.largeTitle)
          .fontWeight(.bold)
        
        MovieGenreView(genres: viewModel.genres)
        
        HStack {
          StarRatingView(movie.vote_average / 2)
            .frame(height: 20)
          
          Text("\(movie.vote_average.formatted()) / 10")
            .font(.footnote)
        }
        
        Text(movie.overview)
          .padding(.horizontal)
      }
    }
    .frame(maxWidth: .infinity)
    .onAppear {
      Task {
        await viewModel.getGenres(genreIds: movie.genre_ids)
      }
    }
  }
}

struct MovieGenreView: View {
  var genres = [String]()
  let elementsPerRow = 3
  
  var body: some View {
    VStack(spacing: 10) {
      ForEach(0 ..< genres.count,
              id: \.self) { index in
        Group {
          if index % elementsPerRow == 0 {
            HStack {
              ForEach(index ..<
                      min(index + elementsPerRow,
                          genres.count),
                      id: \.self) { i in
                PillView(text: genres[i])
              }
            }
          }
        }
      }
    }
  }
}

struct PillView: View {
  var text: String
  
  var body: some View {
    Rectangle()
      .frame(width: 100, height: 25)
      .clipShape(.capsule)
      .foregroundStyle(.gray)
      .overlay {
        Text(text)
          .foregroundStyle(.white)
      }
  }
}
  
  #Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(), movie: Movie(id: 1, original_title: "title", poster_path: "path", vote_average: 2.5, overview: "descroption", genre_ids: [28, 9648, 53, 27]))
  }
