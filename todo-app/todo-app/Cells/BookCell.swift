//
//  BookCell.swift
//  todo-app
//
//  Created by Caique Minhare on 19/03/22.
//

import Foundation
import UIKit

class BookCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var bookThumbnailImageView: UIImageView!
}
