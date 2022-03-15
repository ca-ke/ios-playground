//
//  StoryPromptViewController.swift
//  ios-playground
//
//  Created by Caique Minhare on 13/03/22.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    
    var storyPromptEntry: StoryPromptEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPromptTextView.text = storyPromptEntry?.description
    }
}
