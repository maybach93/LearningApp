//
//  DialogModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 7/3/20.
//

import Foundation

class DialogExtraModel: Decodable, Identifiable {
    var extra: String
    
    init(extra: String) {
        self.extra = extra
    }
}

class DialogQuestionModel: Decodable, Identifiable {
    var question: String
    
    init(question: String) {
        self.question = question
    }
}

struct DialogModel: Decodable, VoiceCommandResponse {
    enum Keys: String, CodingKey { // declaring our keys
        case topic
        case objective
        case extra
        case questions
    }
    
    var command: VoiceCommand {
        .startDialog(.none)
    }
    
    var topic: String
    var objective: String
    var extra: [DialogExtraModel]
    var questions: [DialogQuestionModel]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.topic = try container.decode(String.self, forKey: .topic)
        self.objective = try container.decode(String.self, forKey: .objective)
        let extra: [String] = try container.decode(Array<String>.self, forKey: .extra)
        self.extra = extra.map({ DialogExtraModel(extra: $0) })
        let questions: [String] = try container.decode(Array<String>.self, forKey: .questions)
        self.questions = questions.map({ DialogQuestionModel(question: $0) })
    }
}
