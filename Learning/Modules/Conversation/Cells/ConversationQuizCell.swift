//
//  ConversationQuizCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import SwiftUI

class QuizItemViewModel: ObservableObject, Identifiable {
    var answerModel: QuizAnswerModel
    @Published var isCorrect: Bool = false
    init(answerModel: QuizAnswerModel) {
        self.answerModel = answerModel
    }
}

struct ConversationQuizCell: View {
    var description: String
    @ObservedObject var model: ConversationQuizItemModel
    
    init(description: String, model: ConversationQuizItemModel) {
        self.description = description
        self.model = model
    }
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            Text(self.description).foregroundColor(Color.white).font(.body)
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(model.quizItems) { item in
                    ZStack {
                        if item.isCorrect {
                            Color(.green).opacity(0.4).cornerRadius(30)
                        }
                        else {
                            Color(.black).opacity(0.2).cornerRadius(30)
                        }
                        Text(item.answerModel.word).foregroundColor(.white).font(.title2).fontWeight(.medium).padding()
                    }
                }
            }
        }
    }
}
