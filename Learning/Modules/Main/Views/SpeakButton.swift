//
//  SpeakButton.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation
import SwiftUI
struct SpeakButtonStyle: ButtonStyle {
    @State private var isAnimating: Bool = false

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
            .fill()
            .foregroundColor(Color.blue.opacity(0.2))
            .overlay(
                Circle()
                    .fill(Color.white)
                    .opacity(configuration.isPressed ? 0.3 : 0)
            )
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(configuration.isPressed ? .white : .blue)
                    .padding(4)
            )
            .overlay(
                configuration.label
                    .foregroundColor(.white)
            )
    }
            
}
