//
//  ConversationViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation

class ConversationViewModel: ObservableObject {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}
