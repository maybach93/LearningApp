//
//  VoiceCommandManager.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import Foundation
import Combine

class VoiceCommandManager {
    
    var commandRecognizer: VoiceCommandRecognizer = VoiceCommandRecognizer()
    
    func appendCommand(command: String) -> Future<Never, Never> {
        switch commandRecognizer.append(voiceTranscript: command) {
        default:
            break
        }
    }
}
