//
//  MainView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

class Test: Identifiable {
    
    var title: String = ""
}
struct MainView: View {
    @State var isSpeakPressed: Bool = false
    var viewModel: MainViewModel
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
            return NavigationView {
                    ZStack {
                        VStack {
                            Color(.red)
                            Spacer()
                            if self.viewModel.state == .initial {
                                Button("Speak", action: {
                                    withAnimation {
                                        self.isSpeakPressed.toggle()
                                    }
                                }).buttonStyle(SpeakButtonStyle()).frame(width: 80, height: 80).padding()
                            }
                            
                        }
                        if self.isSpeakPressed {
                            
                            ConversationView(viewModel: ConversationViewModel(router: viewModel.router)).transition(.opacity).edgesIgnoringSafeArea(.all)
                        }
                    }
            }.navigationBarTitle("Learning App").onReceive(self.viewModel.router.$firstController) { (output) in
                if case .main = output {
                    withAnimation {
                        self.isSpeakPressed.toggle()
                    }
                }
            }
    }
}
