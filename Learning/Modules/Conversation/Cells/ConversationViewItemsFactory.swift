//
//  ConversationViewItemsFactory.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/27/20.
//

import Foundation
import SwiftUI

struct ConversationViewItemsFactory {
    
    func cell(for item: ConversationItemViewModel) -> some View {
        
        switch item.type {
        case .userVoice:
            return AnyView(ConversationUserVoiceCell(title: item.title))
        default:
            return AnyView(EmptyView())
        }
    }
}
