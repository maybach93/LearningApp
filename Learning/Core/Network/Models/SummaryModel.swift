//
//  SummaryModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/1/20.
//

import Foundation

struct SummaryProgressModel: Decodable {
    var completed: Int
    var total: Int
}

struct PlanItem: Decodable, Identifiable {
    var id: Int
    var name: String
}

struct SummaryModel: Decodable {
    
    var days: SummaryProgressModel
    var words: SummaryProgressModel
    var grammar: SummaryProgressModel
    var practice: SummaryProgressModel

    var plan: [PlanItem]
}
