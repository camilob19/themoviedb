//
//  ProgressBar.swift
//  TheMoviewDB
//
//  Created by Camilo Betancourt on 9/03/22.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 16.0)
                .opacity(1)
                .foregroundColor(Color.madison)
                .background(Color.madison)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
            Text("\(Int(self.progress*100))%")
                .font(.specialFont)
                .foregroundColor(Color.white)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: .constant(0.8)).frame(width: 40, height: 40, alignment: .center)
    }
}
