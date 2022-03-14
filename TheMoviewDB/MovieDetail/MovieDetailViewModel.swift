//
//  MovieDetailViewModel.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 12/03/22.
//

import Foundation
import SwiftUI

@MainActor class MovieDetailViewModel: ObservableObject {
    
    let movie: Movie
    
    var title: String {
        return movie.title ?? ""
    }
    
    var popularity: String {
        let popularity = movie.popularity ?? 0.0
        switch popularity {
        case let x where x > 1:
            return "\(movie.popularity ?? 0.0) reviews"
        case let x where x == 1:
            return "\(movie.popularity ?? 0.0) review"
        case let x where x == 0:
            return "No reviews"
        default:
            return "No reviews"
        }
        
    }
    
    @AppStorage var likedMovieInfo: Bool
    @AppStorage("favorites") var favorites: [Int] = []
    
    init(movie: Movie) {
        self.movie = movie
        self._likedMovieInfo = AppStorage(wrappedValue: false, "LikedMovie\(movie.id ?? 0)")
    }
    
    func setFavorites() {
        let id = movie.id ?? 0
        
        if favorites.contains(id),
            let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
        } else {
            favorites.append(movie.id ?? 0)
        }
        
        self.objectWillChange.send()
    }
    
    func isFavorite() -> Bool {
        let id = movie.id ?? 0
        return favorites.contains(id)
    }
    
    func setLikeMovie() {
        likedMovieInfo.toggle()
        self.objectWillChange.send()
    }
    
    func getLikeMovie() -> Bool {
        return likedMovieInfo
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
        
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
