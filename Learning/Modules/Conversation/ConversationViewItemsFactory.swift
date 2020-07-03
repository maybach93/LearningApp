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


struct ConversationViewItemsFactory {
    
    func cell(for item: ConversationItemModel) -> some View {
        return Group {
            switch item.item {
            case .userVoice(let message):
                 ConversationUserVoiceCell(title: message)
            case .command(let response):
                switch response.command {
                case .learnNewWord:
                    ConversationNewWordCell(model: response as! LearnNewWordModel)
                case .startQuiz:
                    if let item = item as? ConversationQuizItemModel, let response = response as? QuizItemModel {
                        ConversationQuizCell(description: response.description, model: item)
                    }
                case .startDialog(let context):
                    switch context {
                    case .none:
                        if let response = response as? DialogModel {
                            ConversationDialogCell(model: response)
                        }
                    default:
                        if let response = response as? DialogReportModel {
                            ConversationReportCell(model: response)
                        }
                    }
                default:
                    EmptyView()
                }
            }
        }
    }
}
