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
    
    func appendCommand(command: String) -> Future<VoiceCommandResponse, Never> {
        return Future<VoiceCommandResponse, Never>{ [unowned self] promise in
            switch commandRecognizer.append(voiceTranscript: command) {
            case .learnNewWord:
                network.request(LearnNewWordModel.self, route: .learnNewWord, httpMethod: .get)
                    .sink { (error) in
                    } receiveValue: { [weak self] value in
                        promise(.success(value))
                        self?.speechManager.play(text: value.word)
                }.store(in: &disposeBag)
            case .startQuiz:
                network.request(QuizItemModel.self, route: .quiz, httpMethod: .get).sink { (error) in
                } receiveValue: { [weak self] value in
                    promise(.success(value))
                    self?.speechManager.play(text: value.description)
            }.store(in: &disposeBag)
            case .startDialog(.answer(_)):
                network.request(DialogReportModel.self, route: .dialogReport, httpMethod: .get).sink { (error) in
                } receiveValue: { value in
                    promise(.success(value))
            }.store(in: &disposeBag)
            case .startDialog(.none):
                network.request(DialogModel.self, route: .dialog, httpMethod: .get).sink { (error) in
                } receiveValue: { value in
                    promise(.success(value))
            }.store(in: &disposeBag)
            default:
                break
            }
        }
    }
}
