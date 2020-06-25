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
    @Published var items: [Test]
    
    init(router: Router) {
        self.router = router
        self.items = []
    }
}
