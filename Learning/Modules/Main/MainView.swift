//
//  MainView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

struct Test: Identifiable {
    var id: ObjectIdentifier
    
    var title: String
}
struct MainView: View {
    @State var isToggle: Bool = false
    var viewModel: MainViewModel
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
                
                ZStack {
                    
                    VStack {
                        Color(.red)
                        Spacer()
                        if !self.isToggle {
                            Button(action: {
                                withAnimation {
                                    self.isToggle = true
                                }
                                
                            }) {
                                ActivityIndicator().frame(width: 100, height: 100)
                            }
                        }
                        
                    }
                    if self.isToggle {
                        ConversationView(viewModel: ConversationViewModel(router: viewModel.router)).transition(.move(edge: .bottom)).edgesIgnoringSafeArea(.all)
                    }
                }
            
            
        }.navigationBarTitle("Learning App")
            
        
        
    }
}
