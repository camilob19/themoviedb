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
        NavigationView {
            ZStack {
                CustomNavBar()
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
                                        ScoreMovie()
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

struct CustomNavBar: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Color.madison
                        .frame(height: 100)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
                VStack {
                    ImageAsset.PopularMovies.logoDark
                        .resizable()
                        .frame(width: 200, height: 100)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }
        }
    }
}

struct ScoreMovie: View {
   // @StateObject var viewModel: PopularMoviesViewModel
    
    var body: some View {
        //ProgressBar(progress: $viewModel.$movies)
        ImageAsset.PopularMovies.logoDark
            .resizable()
            .clipShape(Circle())
            .frame(width: 40, height: 40)
            .padding(.bottom, 230)
            .padding(.trailing, 20)
           
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
