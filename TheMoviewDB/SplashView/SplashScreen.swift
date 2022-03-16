//
//  SplashScreen.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 12/03/22.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            HomeTabBar()
        } else {
            VStack {
                VStack {
                    ImageAsset.PopularMovies.logo
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                    Text(Localized.welcome)
                        .padding()
                        .font(Font.headerFont)
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 1
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
