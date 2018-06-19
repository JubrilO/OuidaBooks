//
//  BookCollectionViewCell.swift
//  Ouida Books
//
//  Created by Jubril on 4/23/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var titleSpacingConstraint: NSLayoutConstraint!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //shadowView.layer.applySketchShadow()
    }
    
    override func awakeFromNib() {
        //shadowView.layer.applySketchShadow()
    }
    
}
