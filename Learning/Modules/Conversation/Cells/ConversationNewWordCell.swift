//
//  ConversationNewWordCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import SwiftUI

struct ConversationNewWordCell: View {
    var word: String
    var transcription: String
    var description: String
    var imageName: String
    init(model: LearnNewWordModel) {
        self.word = model.word
        self.transcription = model.transcription
        self.description = model.description
        self.imageName = model.imageUrl ?? ""
    }
    var body: some View {
        VStack {
            AsyncImage(name: imageName, placeholder: Text("")).frame(idealHeight: UIScreen.main.bounds.width / 2).cornerRadius(2)
            Text(self.word).foregroundColor(Color.white).font(.title2).fontWeight(.medium)
            Text(self.transcription).foregroundColor(Color.white.opacity(0.8)).font(.subheadline)
            Text(self.description).foregroundColor(Color.white).font(.body)
        }
    }
}
