//
//  Router.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/25/20.
//

import Foundation
import SwiftUI

enum Controllers {
    case main
    case rootView(AnyView)
}

final class Router: ObservableObject {
    @Published var firstController: Controllers = .main
}
