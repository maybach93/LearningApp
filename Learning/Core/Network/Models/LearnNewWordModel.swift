//
//  LearnNewWordModel.swift
//  Learning
//
//  Created by Vitalii Poponov on 6/27/20.
//

import Foundation

struct LearnNewWordModel: Decodable {
    var word: String
    var transcription: String
    var description: String
    var imageUrl: String?
}
