//
//  WorkshopCollectionViewCell.swift
//  Workshop
//
//  Created by Jay on 9/22/16.
//  Copyright © 2016 Juan Pablo. All rights reserved.
//

import UIKit

class WorkshopCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        // Initialization code
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        
    }
}
