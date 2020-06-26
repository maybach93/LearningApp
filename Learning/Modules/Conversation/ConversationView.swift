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
    init(viewModel: ConversationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
       // NavigationView {
            ZStack {
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(.all)
                List(self.viewModel._items) { (item) in
                    Text("kfeokefoe")
                }.background(Color.clear)
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

            }.onAppear {
                self.viewModel._items.append(Test())
            }
    }
}
