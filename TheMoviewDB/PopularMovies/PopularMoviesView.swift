//
//  PopularMoviesView.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 10/03/22.
//

import SwiftUI

struct PopularMoviesLogo: View {
    var body: some View {
        VStack {
            Image("logo db")
                .resizable()
                .frame(width: 120, height: 30, alignment: .leading)
            .background(Color.clear)
        }
    }
}

struct PopularMoviesView: View {
    @StateObject var viewModel: PopularMoviesViewModel = PopularMoviesViewModel()
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.filteredMovies.results, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(viewModel: viewModel.createModel(for: movie))) {
                            VStack {
                                MovieCell(imageURL: viewModel.getPosterPath(for: movie))
                                VStack {
                                    Text(viewModel.getTitle(for: movie))
                                        .padding()
                                        .foregroundColor(Color.gray)
                                        .font(.bodyFont)
                                        .lineLimit(2)
                                    Spacer()
                                }
                                .padding(.top, -30)
                            }
                            .frame(minHeight: 250, maxHeight: 250, alignment: .center)
                            .frame(minWidth: 200, maxWidth: 200, alignment: .center)
                            .padding()
                        }.accessibilityIdentifier("\(movie.id ?? 0)")
                    }
                        .padding()
                }
                .searchable(text: $viewModel.searchText,
                            prompt: Localized.placeholderSearch)
                .navigationTitle(Localized.navigationTitle)
            }.onAppear {
                self.viewModel.loadMovies()
            }
            .padding()
            .foregroundColor(Color.black)
            Spacer()
        }
    }
}

struct MovieCell: View {
    var imageURL: String
    var body: some View {
        AsyncImage(
            url: URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face\(imageURL)"),
            content: { image in
                image.resizable()
                    .frame(maxWidth: 150, maxHeight: 240)
                    .scaledToFill()
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 6)
            },
            placeholder: {
                ProgressView()
            })
            .padding()
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
