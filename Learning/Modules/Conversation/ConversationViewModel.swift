//
//  ConversationViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation
import Combine
import SwiftUI

class ConversationViewModel: ObservableObject {
    var router: Router
    @Published var items: [ConversationItemModel] = []
    private var disposeBag: Set<AnyCancellable> = Set()
    
    var voiceRecogrnizer = VoiceRecognizer()
    var voiceCommandManager = VoiceCommandManager()

    
    init(router: Router) {
        self.router = router
    }
    
    func dismiss() {
        self.router.firstController = .main
    }
    func speakButton(isToggled: Bool) {
        
        if !isToggled {
            self.voiceRecogrnizer.stop()
            self.items.insert(ConversationItemModel(item: .userVoice("i want to learn a new word")), at: 0)
            voiceCommandManager.appendCommand(command: "i want to learn a new word").sink { (response) in
                self.items.insert(ConversationItemModel(item: .command(response)), at: 0)
            }.store(in: &disposeBag)
        }
        else {
            self.voiceRecogrnizer.startRecognizing().sink { (completion) in
                
            } receiveValue: { [weak self] (value) in
                guard let self = self else { return }
                self.voiceCommandManager.appendCommand(command: value).sink { (response) in
                    self.items.insert(ConversationItemModel(item: .command(response)), at: 0)
                }.store(in: &self.disposeBag)
            }.store(in: &disposeBag)
        }
    }
}
