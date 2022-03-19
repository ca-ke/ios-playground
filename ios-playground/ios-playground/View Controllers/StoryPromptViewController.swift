//
//  StoryPromptViewController.swift
//  ios-playground
//
//  Created by Caique Minhare on 13/03/22.
//

import UIKit

class StoryPromptViewController: UIViewController {

    @IBOutlet weak var storyPromptTextView: UITextView!
    var isNewStoryPrompt = false
    
    var storyPromptEntry: StoryPromptEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPromptTextView.text = storyPromptEntry?.description
        if isNewStoryPrompt {
            addSaveButton()
            addCancelButton()
        }
    }
    
    @objc func cancelStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
    private func addCancelButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
        
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    private func addSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
        navigationItem.rightBarButtonItem = saveButton
    }
}
