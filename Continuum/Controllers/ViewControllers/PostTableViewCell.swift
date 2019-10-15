//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Austin Goetz on 10/15/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCounterLabel: UILabel!
    
    // MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        photoImageView.image = post?.photo
        captionLabel.text = post?.caption
        commentCounterLabel.text = "Comments: \(post?.comments.count ?? 0)"
    }

}
