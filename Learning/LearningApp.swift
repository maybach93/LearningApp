//
//  LearningApp.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(router: Router()))
        }
    }
}
