//
//  ContentView.swift
//  ExamenArgumentativo
//
//  Created by Ricardo Adolfo Fernández Alvarado on 10/10/23.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Movie DB")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.horizontal)
      Spacer()
      List {
        MovieElementView()
        MovieElementView()
        MovieElementView()
        MovieElementView()
        MovieElementView()
      }
    }
    .frame(maxWidth: .infinity)
    .onAppear {
      Task {
        print(await MovieRepository
          .shared.getMovies()?.results)
      }
    }
  }
}

struct MovieElementView: View {
  var body: some View {
    HStack {
      Image(systemName: "person")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding()
        .frame(width: 100, height: 200)
      Spacer()
      Text("Hey")
      Spacer()
    }
  }
}

#Preview {
  MainView()
}
