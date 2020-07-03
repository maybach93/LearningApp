//
//  VoiceCommandRecognizer.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import Foundation
enum VoiceCommand {
    case learnNewWord(ContexualCommand)
    case startQuiz(ContexualCommand)
    case describePicture(ContexualCommand)
    case startDialog(ContexualCommand)
}
enum ContexualCommand {
    case none
    case answer(String)
}
class VoiceCommandRecognizer {
    func append(voiceTranscript: String) -> VoiceCommand {
        return .learnNewWord(.none)
    }
}
