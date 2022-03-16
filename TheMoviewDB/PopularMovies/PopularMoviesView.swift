//
//  PopularMoviesView.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 10/03/22.
//

import SwiftUI

struct PopularMoviesView: View {
    @StateObject var viewModel: PopularMoviesViewModel
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.filteredMovies.results, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailView(viewModel: viewModel.createModel(for: movie))) {
                                ZStack {
                                    MovieCell(imageURL: viewModel.getPosterPath(for: movie))
                                    VStack {
                                        Text(viewModel.getTitle(for: movie))
                                            .foregroundColor(Color.gray)
                                            .font(.bodyFont)
                                            .lineLimit(2)
                                            .padding()
                                            .padding(.top, -50)
                                        Spacer()
                                    }
                                    VStack {
                                        ScoreMovie(score: viewModel.getScore(for: movie))
                                    }
                                }
                                .frame(minHeight: 200, maxHeight: 300, alignment: .center)
                                .frame(minWidth: 200, maxWidth: 200, alignment: .center)
                                .padding(.top, 30)
                            }
                            .accessibilityIdentifier("\(movie.id ?? 0)")
                        }
                    }
                    .searchable(text: $viewModel.searchText,
                                prompt: Localized.placeholderSearch)
                    .navigationTitle(Localized.navigationTitle)
                    .navigationBarTitleDisplayMode(.automatic)
                    .font(Font.bodyFont)
                }.onAppear {
                    self.viewModel.loadMovies()
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct MovieCell: View {
    var imageURL: String
    var body: some View {
        AsyncImage(
            url: URL(string: "\(MoviesConstans.baseUrl)\(imageURL)"),
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

struct ScoreMovie: View {
    @State var score: Float
    
    var body: some View {
        ProgressBar(progress: $score)
            .frame(width: 30, height: 30)
            .padding(.bottom, 230)
            .padding(.trailing, 25)
        
            .frame(
                maxWidth: .infinity,
                alignment: .trailing
            )
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView(viewModel: PopularMoviesViewModel())
    }
}
