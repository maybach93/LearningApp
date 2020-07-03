//
//  DialogReportModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/29/20.
//

import Foundation

struct DialogReportModel: Decodable, VoiceCommandResponse {
    
    var command: VoiceCommand {
        .startDialog(.answer(""))
    }
    
    var total: Int
    var lexical: Float
    var grammar: Float
    var pronunciation: Float
    
    var topicsToRecap: [String]
}
