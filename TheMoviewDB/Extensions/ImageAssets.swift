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
        static let logo = Image("logo splash")
        static let logoDB = Image("logo")
        static let logoDark = Image("logo2")
        static let logoLigth = Image("logo tabview")
    }
    
    struct MovieDetail {
        static let starIcon = Image(systemName: "star")
        static let clockIcon = Image(systemName: "clock")
        static let calendarIcon = Image(systemName: "calendar")
        static let heartFilledIcon = Image(systemName: "heart.fill")
        static let heartIcon = Image(systemName: "heart")
        static let handUpFilledIcon = Image(systemName: "hand.thumbsup.fill")
        static let handUpIcon = Image(systemName: "hand.thumbsup")
        static let handDownFilledIcon = Image(systemName: "hand.thumbsdown.fill")
        static let handDownIcon = Image(systemName: "hand.thumbsdown")
    }
}
