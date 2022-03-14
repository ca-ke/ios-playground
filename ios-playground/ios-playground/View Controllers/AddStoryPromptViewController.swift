//
//  ViewController.swift
//  ios-playground
//
//  Created by Caique Minhare on 13/03/22.
//

import UIKit
import PhotosUI

class AddStoryPromptViewController: UIViewController {
    let storyPromptEntry = StoryPromptEntry()
    
    @IBOutlet weak var nounTextField: UITextField!
    @IBOutlet weak var adjecticeTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var storyPromptImageView: UIImageView!
    
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        let selectedGenre = StoryPrompt.Genre(rawValue: sender.selectedSegmentIndex)
        if let selectedGenre = selectedGenre {
            storyPromptEntry.genre = selectedGenre
        } else {
            storyPromptEntry.genre = .scifi
        }
    }
    
    @IBAction func changeNumber(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        numberLabel.text = "Number: \(sliderValue)"
        storyPromptEntry.number = sliderValue
    }
    
    @IBAction func generateStoryPrompt(_ sender: Any) {
        updateStoryPrompt()
        if storyPromptEntry.isValid() {
            
        } else {
            let alert = UIAlertController(title: "Invalid Story Prompt", message: "Please fill out all of the field", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: { action in })
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
        storyPromptEntry.number = Int(numberSlider.value)
        
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true)
    }

    func updateStoryPrompt() {
        storyPromptEntry.adjective = adjecticeTextField.text ?? ""
        storyPromptEntry.noun = nounTextField.text ?? ""
        storyPromptEntry.verb = verbTextField.text ?? ""
    }
}

extension AddStoryPromptViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        
        return true
    }
}

extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                    }
                }
            }
        }
    }
}
