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
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 8, height: geometry.size.height / 8)
                        //.scaleEffect(!self.isAnimating ? 1.0 - CGFloat(index) / 6.0 : 0.2 + CGFloat(index) / 6.0)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2).foregroundColor(Color.white.opacity(0.8))
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
