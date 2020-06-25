//
//  ConversationView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

struct ConversationView: View {
    
    @State var isToggle: Bool = false
    
    var viewModel: ConversationViewModel
    init(viewModel: ConversationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
       // NavigationView {
            ZStack {
                
                VStack {
                    Spacer()
                    if self.isToggle {
                        Button(action: {
                            self.isToggle = false
                        }) {
                                        Text("Start")
                        }.buttonStyle(SpeakButtonStyle(isSelected: true)).frame(width: 60, height: 60).padding(50)
                    }
                    else {
                        Button(action: {
                            self.isToggle = true
                        }) {
                            Text("Stop")
                        }.buttonStyle(SpeakButtonStyle(isSelected: true)).frame(width: 60, height: 60).padding(50)
                    }
                }
            }
        //}.navigationBarTitle("Learning App")
    }
}
