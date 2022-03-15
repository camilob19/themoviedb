//
//  PopularMoviesViewModel.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 9/03/22.
//

import Foundation
import SwiftUI
import Combine

@MainActor protocol PopularMoviesViewModelProtocol {
    var movies: Movies { get }
    var filteredMovies: Movies { get }
    var searchText: String { get set }
    func loadMovies()
}

@MainActor class PopularMoviesViewModel: PopularMoviesViewModelProtocol, ObservableObject {
    
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
    
    /// Main method call when the view appears
    func loadMovies() {
        self.getMovies().assign(to: &self.$movies)
        $movies.assign(to: &self.$filteredMovies)
    }
    
    /// Gets the list movies information from service
    /// - Returns: Returns a publisher that never send error, on uscceess it will send `Movies` entity
    private func getMovies() -> AnyPublisher<Movies, Never> {
        return repository.getMovies()
    }
}
