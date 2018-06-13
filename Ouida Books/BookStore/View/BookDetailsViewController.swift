//
//  BookDetailsViewController.swift
//  Ouida Books
//
//  Created by Jubril on 5/15/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import Foundation
import UIKit

class BookDetailsViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var relatedBooksSectionView: StoreGridSection!
    @IBOutlet weak var reviewGridView: ReviewsGridView!
    
    var book: Book!
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func onBackButtonTap(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBuyButonTap(_ sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func onLikeButtonTap(_ sender: UIButton) {
        
    }
    
    @IBAction func onShareButtonTap(_ sender: UIButton) {
        
    }
    
    func setupGridViews() {
        relatedBooksSectionView.sectionHeader.text = "Related Books"
        relatedBooksSectionView.seeAllButton.addTarget(self, action: #selector(onRelatedSeeAllButtonTap), for: .touchUpInside)
        reviewGridView.seeAllButton.addTarget(self, action: #selector(onReviewsSeeAllButtonTap), for: .touchUpInside)
    }
    
    @objc func onRelatedSeeAllButtonTap() {
        
    }
    
    @objc func onReviewsSeeAllButtonTap() {
        
    }
}
