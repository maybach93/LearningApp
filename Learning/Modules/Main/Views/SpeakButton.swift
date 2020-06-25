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
    var isSelected: Bool = false
    init(isSelected: Bool) {
        self.isSelected = isSelected
    }
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        EmptyView()

//        Circle()
//            .fill()
//            .overlay(
//                Circle()
//                    .fill(Color.white)
//                    .opacity(configuration.isPressed ? 0.3 : 0)
//            )
//            .overlay(
//                Circle()
//                    .stroke(lineWidth: 2)
//                    .foregroundColor(configuration.isPressed ? .white : .black)
//                    .padding(4)
//            )
//            .overlay(
//                configuration.label
//                    .foregroundColor(.white)
//            )
    }
            
}
