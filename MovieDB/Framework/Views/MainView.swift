//
//  ContentView.swift
//  MovieDB
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewModel()
  
  var body: some View {
    NavigationStack {
      if viewModel.movies.isEmpty {
        Text("No hay contenido para mostrar.")
          .font(.largeTitle)
          .fontWeight(.bold)
          .multilineTextAlignment(.center)
      } else {
        VStack(alignment: .leading) {
          List(viewModel.movies) { movie in
            MovieElementView(movie: movie)
          }
        }
        .navigationTitle("Movie DB")
        .navigationBarTitleDisplayMode(.automatic)
      }
    }
    .onAppear {
      Task {
        await viewModel.getMovies()
      }
    }
  }
}

struct MovieElementView: View {
  let movie: Movie
  
  var body: some View {
    ScrollView {
      NavigationLink {
        MovieDetailView(movie: movie)
      } label: {
        HStack {
          WebImage(url: URL(string: movie.poster_path))
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 150)
            .padding()
          Spacer()
          VStack {
            Text("\(movie.original_title)")
              .font(.headline)
              .padding(.bottom)
              .foregroundStyle(.black)
            StarRatingView(movie.vote_average / 2)
              .frame(height: 20)
          }
          Spacer()
        }
      }
    }
  }
}

#Preview {
  MainView()
}
