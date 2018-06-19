//
//  ReviewsTableViewCell.swift
//  Ouida Books
//
//  Created by Jubril on 19/06/2018.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var cosmosView: UIView!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
