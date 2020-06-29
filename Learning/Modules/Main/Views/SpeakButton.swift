//
//  SpeakButton.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation
import SwiftUI
struct SpeakButtonStyle: ButtonStyle {
    enum ButtonState {
        case ready
        case pulsating
        case processing
    }
    
    @State public var state: ButtonState = .ready

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        ZStack {
            switch state {
            case .ready:
                Circle()
                    .fill()
                    .foregroundColor(.blue)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .opacity(configuration.isPressed ? 0.8 : 0.2)
                    ).frame(width: 60, height: 60)
                    .overlay(
                        configuration.label
                            .foregroundColor(.white)
                    ).shadow(color: Color.blue, radius: 20, x: 0, y: 0)
                Image("speak").renderingMode(.template).foregroundColor(.white)
            case .pulsating:
                PulsationView().frame(width: 70, height: 70)
                Circle()
                    .fill()
                    .foregroundColor(.red)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .opacity(0.2)
                    ).frame(width: 60, height: 60)
                    .shadow(color: Color.blue, radius: 20, x: 0, y: 0)
                Image("speak").renderingMode(.template).foregroundColor(.white)
            case .processing:
                Circle()
                    .fill()
                    .foregroundColor(.orange)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .opacity(0.2)
                    ).frame(width: 60, height: 60)
                    .shadow(color: Color.blue, radius: 20, x: 0, y: 0)
                ActivityIndicator().frame(width: 40, height: 40)
            }
            
        }
    }
            
}
