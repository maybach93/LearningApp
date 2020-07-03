//
//  ConversationView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

struct ConversationView: View {
    
    @State var speakButtonState: SpeakButtonStyle.ButtonState = .ready
    @ObservedObject var viewModel: ConversationViewModel
    var itemsFactory: ConversationViewItemsFactory
    
    init(viewModel: ConversationViewModel, itemsFactory: ConversationViewItemsFactory = ConversationViewItemsFactory()) {
        self.viewModel = viewModel
        self.itemsFactory = itemsFactory
    }
    
    var body: some View {
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(self.viewModel.items) { item in
                        Button(action: {
                            
                        }) {
                            self.itemsFactory.cell(for: item)
                        }.listRowBackground(Color.clear).transition(.move(edge: .top)).animation(.linear).padding([.leading, .trailing], 20).padding(.top, 30)
                    }
                }.listStyle(PlainListStyle())
                VStack {
                    HStack {
                        Button(action: {
                            self.viewModel.dismiss()
                        }) {
                            ZStack {
                                Circle().foregroundColor(Color.black.opacity(0.5)).frame(width: 30, height: 30, alignment: .center)
                                Image(systemName: "arrow.left").foregroundColor(.gray)
                            }
                        }.frame(alignment: .top).padding().padding(.top, 15)
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button("", action: {
                        withAnimation {
                            switch speakButtonState {
                            case .ready:
                                self.viewModel.speakButton(isToggled: true)
                                self.speakButtonState = .pulsating
                            case .pulsating:
                                self.viewModel.speakButton(isToggled: false)
                                self.speakButtonState = .processing
                            default:
                                break
                            }
                        }
                        
                    }).buttonStyle(SpeakButtonStyle(state: self.speakButtonState)).frame(width: 70, height: 70).padding()
                }
            }.onAppear {
                self.speakButtonState = .pulsating
                self.viewModel.speakButton(isToggled: true)
            }
    }
}
