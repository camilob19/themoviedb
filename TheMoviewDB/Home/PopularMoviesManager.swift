//
//  PopularMoviesManager.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 10/03/22.
//

import Foundation
import Combine

protocol PopularMoviesManagerProtocol {
    func getMovies() -> AnyPublisher<Movies, Never>
}

class PopularMoviesManager: PopularMoviesManagerProtocol {
    func getMovies() -> AnyPublisher<Movies, Never> {
      guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ebb7891ed43a06f1ce5197b786053857&language=en-US&page=1") else {
        return Just(Movies()).eraseToAnyPublisher()
      }
      
      return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: Movies.self, decoder: JSONDecoder())
        .replaceError(with: Movies())
        .eraseToAnyPublisher()
    }
}
