//
//  StoryPromptTableViewController.swift
//  ios-playground
//
//  Created by Caique Minhare on 15/03/22.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    var storyPromptEntries: [StoryPromptEntry] = [StoryPromptEntry]()
    
    
    
    @IBAction func onAddStoryPromptClicked(_ sender: Any) {
        performSegue(withIdentifier: "ShowAddStoryPrompt", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyPromptEntry1 = StoryPromptEntry()
        let storyPromptEntry2 = StoryPromptEntry()
        let storyPromptEntry3 = StoryPromptEntry()
        let storyPromptEntry4 = StoryPromptEntry()
        
        storyPromptEntry1.noun = "toaster"
        storyPromptEntry1.adjective = "smelly"
        storyPromptEntry1.verb = "attacks"
        storyPromptEntry1.number = 5
        
        storyPromptEntry2.noun = "toaster"
        storyPromptEntry2.adjective = "smelly"
        storyPromptEntry2.verb = "attacks"
        storyPromptEntry2.number = 5
        
        storyPromptEntry3.noun = "toaster"
        storyPromptEntry3.adjective = "smelly"
        storyPromptEntry3.verb = "attacks"
        storyPromptEntry3.number = 5
        
        storyPromptEntry4.noun = "toaster"
        storyPromptEntry4.adjective = "smelly"
        storyPromptEntry4.verb = "attacks"
        storyPromptEntry4.number = 5
        
        storyPromptEntries = [storyPromptEntry1, storyPromptEntry2, storyPromptEntry3, storyPromptEntry4]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyPromptEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "Prompt \(indexPath.row + 1)"
        cell.imageView?.image = storyPromptEntries[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPromptEntry = storyPromptEntries[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPromptEntry)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPrompt" {
            let destinationViewController = segue.destination as? StoryPromptViewController
            guard let storyPromptEntry = sender as? StoryPromptEntry else {
                return
            }
            guard let storyPromptViewController = destinationViewController else {
                return
            }
            storyPromptViewController.storyPromptEntry = storyPromptEntry
        }
    }
}
