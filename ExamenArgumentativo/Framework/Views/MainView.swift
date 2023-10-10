//
//  ContentView.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import SwiftUI

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
        MovieElementView(
          movieTitle: movie.original_title)
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
  let movieTitle: String
  
  var body: some View {
    HStack {
      Image(systemName: "person")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding()
        .frame(width: 100, height: 200)
      Spacer()
      Text(movieTitle)
      Spacer()
    }
  }
}

#Preview {
  MainView()
}
