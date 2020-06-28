//
//  ConversationNewWordCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import SwiftUI

struct ConversationNewWordCell: View {
    var title: String
    
    init(model: LearnNewWordModel) {
        
    }
    var body: some View {
        ZStack {
            
            Text(self.title).frame(alignment: .leading)
        }
    }
}
