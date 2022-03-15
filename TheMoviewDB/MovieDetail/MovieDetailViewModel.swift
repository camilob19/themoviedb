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
    
    nonisolated var title: String {
        movie.title ?? ""
    }
    
    nonisolated var popularity: String {
        let popularity = movie.popularity ?? 0.0
        switch popularity {
        case let x where x > 1:
            return String(format: Localized.formatReviews, movie.popularity ?? 0.0)
        case let x where x == 1:
            return String(format: Localized.formatReviews, movie.popularity ?? 0.0)
        case let x where x == 0:
            return Localized.noReviews
        default:
            return Localized.noReviews
        }
    }
    
    nonisolated var voteAverage: String {
        let formatted = String(format: Localized.formatRating, movie.voteAverage ?? 0.0)
        return formatted
    }
    
    nonisolated var releaseDate: String {
        "\(movie.releaseDate ?? "") \(Localized.released)"
    }
    
    nonisolated var backgroundImageURL: URL? {
        URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face\(movie.backdropPath ?? "")")
    }
    
    nonisolated var posterPath: URL? {
        URL(string: "https://www.themoviedb.org/t/p/w220_and_h330_face\(movie.posterPath ?? "")")
    }
    
    nonisolated var score: Float {
        Float(movie.voteAverage ?? 0) / 10
    }
    
    nonisolated var overview: String {
        movie.overview ?? ""
    }
    
    @AppStorage("LikedMovie") var likes: [Int] = []
    @AppStorage("DislikedMovie") var dislikes: [Int] = []
    @AppStorage("favorites") var favorites: [Int] = []
    
    init(movie: Movie) {
        self.movie = movie
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
        let id = movie.id ?? 0
        
        if likes.contains(id),
           let index = likes.firstIndex(of: id) {
            likes.remove(at: index)
        } else {
            likes.append(movie.id ?? 0)
        }
        
        self.objectWillChange.send()
    }
    
    func getLikeMovie() -> Bool {
        let id = movie.id ?? 0
        return likes.contains(id)
    }
    
    func setDislikeMovie() {
        let id = movie.id ?? 0
        
        if dislikes.contains(id),
           let index = dislikes.firstIndex(of: id) {
            dislikes.remove(at: index)
        } else {
            dislikes.append(movie.id ?? 0)
        }
        
        self.objectWillChange.send()
    }
    
    func getdislikeMovie() -> Bool {
        let id = movie.id ?? 0
        return dislikes.contains(id)
    }
}
