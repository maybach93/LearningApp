//
//  SummaryWidgetViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/1/20.
//

import Foundation

class SummaryWidgetViewModel: ObservableObject {
    var router: Router
    @Published private(set) var state: State = .loading
    
    var network: NetworkProvider = NetworkProvider()
    
    init(router: Router) {
        self.router = router
       
        network.request(<#T##type: Decodable.Protocol##Decodable.Protocol#>, route: <#T##NetworkProvider.NetworkRoutes#>, httpMethod: <#T##NetworkProvider.HttpMethod#>)
        
        
    }
}
extension SummaryWidgetViewModel {
    enum State {
        case loading
        case presented
    }
}
