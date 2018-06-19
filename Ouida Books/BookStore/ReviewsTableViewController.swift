//
//  ReviewsTableViewController.swift
//  Ouida Books
//
//  Created by Jubril on 19/06/2018.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UIViewController {

    @IBOutlet weak var subheadingLabel: UILabel!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let testReview = "Consectetuer adipiscing elit. Aenean commodo ,"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupTableView() {
        tableView.separatorColor = UIColor.clear
        tableView.tableFooterView = UIView()
    }

}

extension ReviewsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.ReviewsTableViewCell) as! ReviewsTableViewCell
        cell.reviewLabel.text = testReview
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let maxHeight: CGFloat = 203
        
        let staticContentHeight: CGFloat = 120
        
        let reviewLabelHeight = testReview.height(withConstrainedWidth: tableView.bounds.width - 80, font: UIFont.systemFont(ofSize: 16))
        let contentHeight = reviewLabelHeight + staticContentHeight
        print(tableView.bounds.width - 80)
        print("Content HEight: \(contentHeight)  ")
        
        if contentHeight < maxHeight {
            return  contentHeight
        }
    
        
        return maxHeight
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}
