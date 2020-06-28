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
    
    @State var isSpeakPressed: Bool = true
    var viewModel: ConversationViewModel
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
                            self.viewModel.dismiss()
                        }) {
                            self.itemsFactory.cell(for: item)
                        }.listRowBackground(Color.clear).padding()
                    }
                }.listStyle(PlainListStyle())

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
            }.navigationBarHidden(true)
    }
}
