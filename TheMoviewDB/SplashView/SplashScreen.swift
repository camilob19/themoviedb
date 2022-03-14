//
//  SplashScreen.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 12/03/22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            PopularMoviesView()
            ZStack {
                Image("logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fill)
                    .frame(width: animate ? nil : 300,
                           height: animate ? nil : 200,
                           alignment: .center)
                
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.30)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
