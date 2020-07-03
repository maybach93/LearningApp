//
//  LearningApp.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import SwiftUI

@main
struct LearningApp: App {
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none

    }
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(router: Router()))
        }
    }
}
