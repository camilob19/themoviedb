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
    
    init(repository: PopularMoviesRepositoryProtocol = PopularMoviesRepository()) {
        self.repository = repository
    }
    
    func  getScore(for movie: Movie) -> Float {
        Float(movie.voteAverage ?? 0.0) / 10
    }
    
    func  getPosterPath(for movie: Movie) -> String {
        movie.posterPath ?? ""
    }
    
    func  getTitle(for movie: Movie) -> String {
        movie.title ?? ""
    }
    
    func createModel(for movie: Movie) -> MovieDetailViewModel {
        return MovieDetailViewModel(movie: movie)
    }
    
    func loadMovies() {
        self.getMovies().assign(to: &self.$movies)
        $movies.assign(to: &self.$filteredMovies)
    }
    
    private func getMovies() -> AnyPublisher<Movies, Never> {
        
        return repository.getMovies()
    }
}
