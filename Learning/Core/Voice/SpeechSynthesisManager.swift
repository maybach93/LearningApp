//
//  SpeechSynthesisManager.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/28/20.
//

import Foundation
import AVFoundation

class SpeechSynthesisManager: NSObject {
    
    private let synthesizer = AVSpeechSynthesizer()
    
    lazy var queue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func play(text: String) {
        queue.addOperation {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5
            self.synthesizer.speak(utterance)
            self.queue.isSuspended = true
        }
    }
}

extension SpeechSynthesisManager: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.queue.isSuspended = false
    }
}
