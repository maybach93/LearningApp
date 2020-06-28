//
//  VoiceCommandManager.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/26/20.
//

import Foundation
import Combine

class VoiceCommandManager {
    
    private var disposeBag: Set<AnyCancellable> = Set()
    
    var commandRecognizer: VoiceCommandRecognizer = VoiceCommandRecognizer()
    var speechManager: SpeechSynthesisManager = SpeechSynthesisManager()
    var network: NetworkProvider = NetworkProvider()
    
    func appendCommand(command: String) -> Future<VoiceCommandResponseProtocol, Never> {
        return Future<VoiceCommandResponseProtocol, Never>{ [unowned self] promise in
            switch commandRecognizer.append(voiceTranscript: command) {
            case .learnNewWord:
                network.request(LearnNewWordModel.self, route: .learnNewWord, httpMethod: .get)
                    .sink { (error) in
                    } receiveValue: { [weak self] value in
                        promise(.success(value))
                        self?.speechManager.play(text: value.word)
                }.store(in: &disposeBag)
            default:
                break
            }
        }
    }
}
