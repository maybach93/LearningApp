//
//  ConversationItemViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation

extension ConversationItemViewModel {
    enum ItemType {
        case userVoice
    }
}
class ConversationItemViewModel: Identifiable {
    var type: ItemType
    var title = ""
    
    init(type: ItemType, title: String) {
        self.type = type
        self.title = title
    }
}
