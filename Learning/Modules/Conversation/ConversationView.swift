//
//  ConversationView.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
struct ConversationView: View {
    
    @State var isSpeakPressed: Bool = false
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
                        }.listRowBackground(Color.clear).padding().transition(.move(edge: .top)).animation(.linear)
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
                        }.frame(alignment: .top).padding().padding(.top, 10)
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isSpeakPressed.toggle()
                            self.viewModel.speakButton(isToggled: self.isSpeakPressed)
                        }
                        
                    }) {
                        if self.isSpeakPressed {
                            PulsationView().frame(width: 80, height: 80)
                        }
                    }.buttonStyle(SpeakButtonStyle()).frame(width: 80, height: 80).padding()
                }
            }.navigationBarHidden(true).onAppear {
                self.isSpeakPressed = true
                self.viewModel.speakButton(isToggled: self.isSpeakPressed)
            }
    }
}
