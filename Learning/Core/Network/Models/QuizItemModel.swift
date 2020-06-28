//
//  QuizItemModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation

struct QuizAnswerModel: Decodable {
    var word: String
    var isCorrect: Bool
}

struct QuizItemModel: Decodable, VoiceCommandResponse {
    
    var command: VoiceCommand {
        .startQuiz(.none)
    }
    
    var description: String
    var options: [QuizAnswerModel]
}
