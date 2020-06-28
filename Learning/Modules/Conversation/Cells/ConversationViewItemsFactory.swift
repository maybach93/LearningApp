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
    case command(VoiceCommandResponseProtocol)
}

class ConversationItemModel: Identifiable {
    var item: ConversationItem
    
    init(item: ConversationItem) {
        self.item = item
    }
}

struct ConversationViewItemsFactory {
    
    func cell(for item: ConversationItemModel) -> some View {
        
        switch item.item {
        case .userVoice(let message):
            return AnyView(ConversationUserVoiceCell(title: message))
        case .command(let response):
            return AnyView(ConversationNewWordCell(model: response as! LearnNewWordModel))
        default:
            return AnyView(EmptyView())
        }
    }
}
