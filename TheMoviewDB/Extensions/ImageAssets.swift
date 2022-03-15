//
//  UIImageAssets.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import Foundation
import SwiftUI

struct ImageAsset {
    struct TabView {
        static let houseIcon = Image(systemName: "house.fill")
        static let heartIcon = Image(systemName: "suit.heart.fill")
        static let handIcon = Image(systemName: "hand.thumbsup")
    }
    
    struct PopularMovies {
        static let logoDB = Image("logo db")
    }
    
    struct MovieDetail {
        static let starIcon = Image(systemName: "star")
        static let clockIcon = Image(systemName: "clock")
        static let calendarIcon = Image(systemName: "calendar")
        static let heartIcon = Image(systemName: "heart")
        static let handFilledIcon = Image(systemName: "hand.thumbsup.fill")
        static let handIcon = Image(systemName: "hand.thumbsup")
    }
}
