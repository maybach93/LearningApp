//
//  ConversationViewItemsFactory.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/27/20.
//

import Foundation
import SwiftUI

enum ConversationItem {
    case userVoice(String)
    case command(VoiceCommandResponse)
}

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
struct ConversationViewItemsFactory {
    
    func cell(for item: ConversationItemModel) -> some View {
        
        switch item.item {
        case .userVoice(let message):
            return AnyView(ConversationUserVoiceCell(title: message))
        case .command(let response):
            switch response.command {
            case .learnNewWord:
                return AnyView(ConversationNewWordCell(model: response as! LearnNewWordModel))
            case .startQuiz:
                guard let item = item as? ConversationQuizItemModel, let response = response as? QuizItemModel else { return AnyView(EmptyView()) }
                return AnyView(ConversationQuizCell(description: response.description, model: item))
            case .startDialog(let context):
                switch context {
                case .none:
                    guard let response = response as? DialogModel else { return AnyView(EmptyView()) }
                    return AnyView(ConversationDialogCell(model: response))
                default:
                    guard let response = response as? DialogReportModel else { return AnyView(EmptyView()) }
                    return AnyView(ConversationReportCell(model: response))
                }
            default:
                return AnyView(EmptyView()) 
            }
        }
    }
}
