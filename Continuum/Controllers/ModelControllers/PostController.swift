//
//  PostController.swift
//  Continuum
//
//  Created by Austin Goetz on 10/15/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit
import CloudKit

class PostController {
    
    // MARK: - Singleton
    static let shared = PostController()
    
    // MARK: - SoT
    var posts: [Post] = []
    
    // MARK: - CRUD
    func creatPostWith(image: UIImage, caption: String, completion: @escaping (Post?) -> Void) {
        
        let newPost = Post(caption: caption, photo: image)
        self.posts.append(newPost)
        
    }
    func addComment(text: String, post: Post, completion: @escaping (Comment) -> Void ) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }
    
    
    
}
