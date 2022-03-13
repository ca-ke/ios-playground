//
//  StoryPromptEntry.swift
//  ios-playground
//
//  Created by Caique Minhare on 13/03/22.
//

import Foundation
import UIKit

class StoryPromptEntry {
    var number = 0
    var verb = ""
    var adjective = ""
    var noun = ""
    var image = UIImage(named: "object-object_box-of-books")
    var genre = StoryPrompt.Genre.scifi
    var text = ""
    
    init() {
        text = StoryPrompt.propmtFor(genre: genre)
    }
    
    func isValid() -> Bool {
        let hasNoun = !noun.isEmpty
        let hasVerb = !verb.isEmpty
        let hasAdjective = !verb.isEmpty
        let hasEnteredAllValues = hasNoun && hasVerb && hasAdjective
        return hasEnteredAllValues
    }
}

extension StoryPromptEntry: CustomStringConvertible {
    var description: String {
        return text.replacingOccurrences(of: "<noun>", with: noun)
                       .replacingOccurrences(of: "<verb>", with: verb)
                       .replacingOccurrences(of: "<number>", with: String(number))
                       .replacingOccurrences(of: "<adjective>", with: adjective)
    }
}
