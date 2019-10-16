//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Austin Goetz on 10/15/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = ""
        selectImageButton.titleLabel?.text = "Select Image"
        photoImageView.image = nil
        
    }

    // MARK: - Actions
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        photoImageView.image = #imageLiteral(resourceName: "spaceEmptyState")
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let image = photoImageView.image,
            let caption = captionTextField.text else {return}
        PostController.shared.creatPostWith(image: image, caption: caption) { (post) in
            
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
}
