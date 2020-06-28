//
//  LearnNewWordModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/27/20.
//

import Foundation

protocol VoiceCommandResponseProtocol {
    var command: VoiceCommand { get }
}
struct LearnNewWordModel: Decodable, VoiceCommandResponseProtocol {
    
    var command: VoiceCommand {
        .learnNewWord(.none)
    }
    
    var word: String
    var transcription: String
    var description: String
    var imageUrl: String?
}
