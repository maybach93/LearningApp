//
//  MainViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    var router: Router
    @Published private(set) var state: State = .initial

    
    init(router: Router) {
        self.router = router

    }
    
    func speakToggled() {
        self.state = .speak
    }
}
extension MainViewModel {
    enum State {
        case initial
        case speak
    }
}
