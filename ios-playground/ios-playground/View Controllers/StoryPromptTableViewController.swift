//
//  StoryPromptTableViewController.swift
//  ios-playground
//
//  Created by Caique Minhare on 15/03/22.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    var storyPromptEntries: [StoryPromptEntry] = [StoryPromptEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
        guard let storyPromptViewController = unwindSegue.source as? StoryPromptViewController,
              let storyPrompt = storyPromptViewController.storyPromptEntry else {
            return
        }
        
        storyPromptEntries.append(storyPrompt)
        tableView.reloadData()
    }
    
    @IBAction func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
        
    }
}
