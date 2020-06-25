//
//  ActivityIndicator.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<6) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 6, height: geometry.size.height / 6)
                        //.scaleEffect(!self.isAnimating ? 1 - CGFloat(index) / 6 : 0.2 + CGFloat(index) / 6)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2).foregroundColor(.blue)
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                    .animation(Animation
                        .timingCurve(0.8, 0.2 + Double(index) / 6, 0.25, 1, duration: 1)
                        .repeatForever(autoreverses: false))
            }
        }.aspectRatio(1, contentMode: .fit)
            .onAppear {
                self.isAnimating = true
            }
    }
    
}
