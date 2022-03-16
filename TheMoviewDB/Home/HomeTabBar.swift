//
//  HomeTabBar.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 14/03/22.
//

import SwiftUI

struct HomeTabBar: View {
    var body: some View {
        TabView {
            PopularMoviesView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text(Localized.popularText)
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "suit.heart.fill")
                    Text(Localized.favoriteText)
                }
            LikesView()
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(Localized.likeText)
                }
        }
        .accentColor(.cerulean)
    }
}

struct HomeTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBar()
    }
}
