//
//  LikesView.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import SwiftUI

struct LikesView: View {
    @StateObject var viewModel: LikesViewModel
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                CustomNavBar()
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.filteredMovies.results, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailView(viewModel: viewModel.createModel(for: movie))) {
                                ZStack {
                                    MovieCell(imageURL: viewModel.getPosterPath(for: movie))
                                    VStack(spacing: 0) {
                                        Text(viewModel.getTitle(for: movie))
                                            .foregroundColor(Color.gray)
                                            .font(.bodyFont)
                                            .lineLimit(2)
                                        Spacer()
                                    }
                                    .padding(.top, -20)
                                }
                                .frame(minHeight: 300, maxHeight: 300, alignment: .center)
                                .padding()
                            }
                            .accessibilityIdentifier("\(movie.id ?? 0)")
                        }
                    }
                    .searchable(text: $viewModel.searchText,
                                prompt: Localized.placeholderSearch)
                    .navigationTitle(Localized.likes)
                    .font(Font.bodyFont)
                }.onAppear {
                    self.viewModel.loadMovies()
                }
                .padding()
            }
        }
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
                        .padding(.top, 20)
                        .frame(width: 170, height: 100)
                        .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView(viewModel: LikesViewModel())
    }
}
