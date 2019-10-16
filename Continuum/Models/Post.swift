//
//  Post.swift
//  Continuum
//
//  Created by Austin Goetz on 10/15/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit
import CloudKit

class Post {
    
    var photoData: Data?
    let timestamp: Date
    let caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else {return nil}
            return UIImage(data: photoData)
        }
        set {photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(timestamp: Date = Date(), caption: String, photo: UIImage, comments: [Comment] = []) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
}

class Comment {
    
    let text: String
    let timestamp: Date
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}
