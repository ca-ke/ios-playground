//
//  ViewController.swift
//  todo-app
//
//  Created by Caique Minhare on 18/03/22.
//

import UIKit

class LibraryViewController: UITableViewController {
    

    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { fatalError("Nothing selected!") }
        let selectedBook = Library.books[indexPath.row]
        return DetailViewController(coder: coder, book: selectedBook)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.books.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath == IndexPath(row: 0, section: 0) {
            let addNewBookCell = buildNewBookCell(tableView, indexPath: indexPath)
            return addNewBookCell
        } else {
            let bookCell = buildBookCell(tableView, indexPath: indexPath)
            return bookCell
        }
    }
    
    private func buildNewBookCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewBookCell.self)", for: indexPath) as? NewBookCell else {
            fatalError("You shall not pass!")
        }
        return cell
    }
    
    private func buildBookCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else {
            fatalError("You shall not pass!")
        }
        
        let book = Library.books[indexPath.row - 1]
        
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.reviewLabel.text = book.review
        
        cell.bookThumbnailImageView.image = book.image
        cell.bookThumbnailImageView.layer.cornerRadius = 12
        
        return cell
    }
}

