//
//  ViewController.swift
//  todo-app
//
//  Created by Caique Minhare on 18/03/22.
//

import UIKit

class LibraryViewController: UITableViewController {

    var books: [Book] = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = createBook(indexPath: indexPath)
        
      
        cell.textLabel?.text = book.title
        cell.imageView?.image = book.image
        
        return cell
    }
    
    private func createBook(indexPath: IndexPath) -> Book {
        let book = Book(title: "Title \(indexPath)", author: "Author \(indexPath)", image: UIImage(systemName: "\(indexPath.row).square.fill")!)
        return book
    }

}

