//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Austin Goetz on 10/15/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var followPostButton: UIButton!
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    // MARK: - Receiver
    var postReceiver: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add a Comment", message: "Plz be nice", preferredStyle: .alert)
        alertController.addTextField { (textField) in
          textField.placeholder = "Your witty comment here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let commentAction = UIAlertAction(title: "Comment", style: .default) { (_) in
          guard let commentText = alertController.textFields?.first?.text,
            !commentText.isEmpty,
            let post = self.post else { return }
          PostController.shared.addComment(text: commentText, post: post, completion: { (comment) in
          })
          self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
    func updateViews() {
        guard let post = post else {return}
        photoImageView.image = post.photo
        tableView.reloadData()
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.timestamp.formatDate()
        
        return cell
    }
}
