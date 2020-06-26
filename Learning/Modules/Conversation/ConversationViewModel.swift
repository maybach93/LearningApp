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
    @Published  var _items: [Test] = []
    private var disposeBag: Set<AnyCancellable> = Set()
    
    var voiceRecogrnizer = VoiceRecognizer()
    
    var items: Binding<[Test]> {
        return Binding<[Test]>(get: { return self._items }, set: {
            self._items = $0
        })
    }
    
    init(router: Router) {
        self.router = router
        self._items.append(Test())
    }
    func speakButton(isToggled: Bool) {
        if isToggled {
            self.voiceRecogrnizer.stop()
        }
        else {
            self.voiceRecogrnizer.startRecognizing().sink { (completion) in
                
            } receiveValue: { (value) in
                
            }.store(in: &disposeBag)
        }
    }
}
