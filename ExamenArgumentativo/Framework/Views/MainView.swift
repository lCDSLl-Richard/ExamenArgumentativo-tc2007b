//
//  ContentView.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewModel()
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Movie DB")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.horizontal)
      Spacer()
      List(viewModel.movies) { movie in
        MovieElementView(movie: movie)
      }
    }
    .frame(maxWidth: .infinity)
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
        Text("\(movie.vote_average.formatted()) / 10")
      }
      Spacer()
    }
  }
}

#Preview {
  MainView()
}
