//
//  ConversationDialogCell.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/3/20.
//

import Foundation
import SwiftUI

struct ConversationDialogCell: View {
    
    var model: DialogModel
    init(model: DialogModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {

            Text(self.model.topic).foregroundColor(Color.white).font(.title2).fontWeight(.medium)
            Text(self.model.objective).foregroundColor(Color.white.opacity(0.8)).font(.subheadline).fixedSize(horizontal: false, vertical: true)

            ForEach(model.questions) { item in
                ZStack {
                    Color(.white).opacity(0.15).cornerRadius(10)
                    HStack {
                        Circle().stroke(Color.white, lineWidth: 2).frame(width: 15, height: 15).opacity(0.5)
                        Text(item.question).foregroundColor(.white).font(.footnote).frame(alignment: .leading).padding(.leading, 10).fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }.padding([.leading, .trailing, .top, .bottom], 10)
                }
            }
        }
    }
}
