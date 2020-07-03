//
//  ConversationItemModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/3/20.
//

import Foundation

class ConversationItemModel: ObservableObject, Identifiable {
    var item: ConversationItem
    
    init(item: ConversationItem) {
        self.item = item
    }
}

class ConversationQuizItemModel: ConversationItemModel {
    @Published var quizItems: [QuizItemViewModel]
    init(item: QuizItemModel) {
        self.quizItems = item.options.map({ QuizItemViewModel(answerModel: $0)})
        super.init(item: .command(item))
    }
}
