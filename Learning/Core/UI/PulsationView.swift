//
//  PulsationView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import Foundation
import SwiftUI

struct PulsationView: View {
    
    @State private var isAnimating: Bool = false
    @State private var wave: Bool = false
    @State private var wave1: Bool = false
    @State private var wave2: Bool = false
    
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 15)
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
                .scaleEffect(wave ? 2 : 1)
                .opacity(wave ? 0 : 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.5)).onAppear {
                    self.wave.toggle()
                }
            Circle().stroke(lineWidth: 15)
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
                .scaleEffect(wave1 ? 2 : 1)
                .opacity(wave1 ? 0 : 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.7)).onAppear {
                    self.wave1.toggle()
                }
            Circle().stroke(lineWidth: 15)
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
                .scaleEffect(wave1 ? 2 : 1)
                .opacity(wave2 ? 0 : 1)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false).speed(0.9)).onAppear {
                    self.wave2.toggle()
                }
                
        }
    }

}
