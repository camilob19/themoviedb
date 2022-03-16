//
//  FavoritesViewModel.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import SwiftUI
import Combine

@MainActor protocol FavoritesViewModelProtocol {
    var movies: Movies { get }
    var filteredMovies: Movies { get }
    var searchText: String { get set }
    func loadMovies()
}

@MainActor class FavoritesViewModel: FavoritesViewModelProtocol, ObservableObject {
    
    let repository: PopularMoviesRepositoryProtocol
    
    @Published var movies: Movies = Movies()
    @Published var filteredMovies: Movies = Movies()
    @Published var searchText: String = "" {
        didSet {
            if searchText == "" {
                self.filteredMovies = self.movies
            } else {
                self.filteredMovies.results = movies.results.filter({$0.title?.contains(searchText) ?? false })
            }
        }
    }
    
    @AppStorage("favorites") var favorites: [Int] = []
    
    func  getPosterPath(for movie: Movie) -> String {
        movie.posterPath ?? ""
    }
    
    func  getTitle(for movie: Movie) -> String {
        movie.title ?? ""
    }
    
    init(repository: PopularMoviesRepositoryProtocol = PopularMoviesRepository()) {
        self.repository = repository
    }
    
    func createModel(for movie: Movie) -> MovieDetailViewModel {
        return MovieDetailViewModel(movie: movie)
    }
    
    func loadMovies() {
        self.getMovies().map({ movies in
            var newMovies = movies
            newMovies.results = movies.results.filter { self.favorites.contains($0.id ?? 0) }
            return newMovies
        }).assign(to: &self.$movies)
        $movies.assign(to: &self.$filteredMovies)
    }
    
    private func getMovies() -> AnyPublisher<Movies, Never> {
        return repository.getMovies()
    }
}
