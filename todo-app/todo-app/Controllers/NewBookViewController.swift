//
//  NewBookViewController.swift
//  todo-app
//
//  Created by Caique Minhare on 22/03/22.
//

import Foundation
import UIKit

class NewBookViewController : UITableViewController {
    
    @IBOutlet var titleTextView: UITextField!
    @IBOutlet var authorTextView: UITextField!
        
    override func viewDidLoad() {
        titleTextView.addDoneButton()
        authorTextView.addDoneButton()
    }
}

extension UITextField {
    func addDoneButton() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
        toolbar.items = [flexSpace, doneButton]
        self.inputAccessoryView = toolbar
    }
}

