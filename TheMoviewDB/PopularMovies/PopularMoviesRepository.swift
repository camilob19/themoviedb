//
//  PopularMoviesRepository.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 10/03/22.
//

import Foundation
import Combine

protocol PopularMoviesRepositoryProtocol {
    func getMovies() -> AnyPublisher<Movies, Never>
}

class PopularMoviesRepository: PopularMoviesRepositoryProtocol {
    func getMovies() -> AnyPublisher<Movies, Never> {
        guard let url = URL(string: "\(MoviesConstans.api)\(MoviesConstans.apiKey)") else {
            return Just(Movies()).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Movies.self, decoder: JSONDecoder())
            .replaceError(with: Movies())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
