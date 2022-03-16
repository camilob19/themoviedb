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
            PopularMoviesView(viewModel: PopularMoviesViewModel())
                .tabItem {
                    ImageAsset.TabView.houseIcon
                    Text(Localized.popularText)
                }
            FavoritesView(viewModel: FavoritesViewModel())
                .tabItem {
                    ImageAsset.TabView.heartIcon
                    Text(Localized.favoriteText)
                }
            LikesView(viewModel: LikesViewModel())
                .tabItem {
                    ImageAsset.TabView.handIcon
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
