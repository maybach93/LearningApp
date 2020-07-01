//
//  SummaryWidgetViewModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/1/20.
//

import Foundation
import Combine

class SummaryWidgetViewModel: ObservableObject {
    var router: Router
    private var disposeBag: Set<AnyCancellable> = Set()
    
    @Published private(set) var state: State = .loading
    var network: NetworkProvider = NetworkProvider()
    
    init(router: Router) {
        self.router = router
       
        network.request(SummaryModel.self, route: .summary, httpMethod: .get).sink { (error) in
        } receiveValue: { [weak self] (value) in
            self?.state = .presented(value)
        }.store(in: &disposeBag)

        
    }
}
extension SummaryWidgetViewModel {
    enum State {
        case loading
        case presented(SummaryModel)
    }
}
