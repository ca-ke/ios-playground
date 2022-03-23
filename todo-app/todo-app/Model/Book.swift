//
//  Book.swift
//  todo-app
//
//  Created by Caique Minhare on 19/03/22.
//

import Foundation
import UIKit

struct Book {
    let title: String
    let author: String
    var review: String?
    
    var image: UIImage {
        Library.loadImage(forBook: self) ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
