//
//  ConversationUserVoiceCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import SwiftUI

struct ConversationUserVoiceCell: View {
    var title: String
    
    var body: some View {
        ZStack {
            Text(self.title).frame(alignment: .leading)
        }
    }
}
