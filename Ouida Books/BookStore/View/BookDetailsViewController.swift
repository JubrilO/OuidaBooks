//
//  BookDetailsViewController.swift
//  Ouida Books
//
//  Created by Jubril on 5/15/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import Foundation
import UIKit
import FolioReaderKit

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
    let folioReader  = FolioReader()
    
    override func viewDidLoad() {
        setupGridViews()
        setupLabels()
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
        if navigationController == nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onBuyButonTap(_ sender: UITapGestureRecognizer) {
        open()
    }
    
    @IBAction func onLikeButtonTap(_ sender: UIButton) {
        
    }
    
    @IBAction func onShareButtonTap(_ sender: UIButton) {
        
    }
    
    private func readerConfiguration() -> FolioReaderConfig {
        let config = FolioReaderConfig()
        config.shouldHideNavigationOnTap = true
        config.scrollDirection = .vertical
        
        // See more at FolioReaderConfig.swift
        //        config.canChangeScrollDirection = false
        //        config.enableTTS = false
        //        config.displayTitle = true
        //        config.allowSharing = false
        //        config.tintColor = UIColor.blueColor()
        //        config.toolBarTintColor = UIColor.redColor()
        //        config.toolBarBackgroundColor = UIColor.purpleColor()
        //        config.menuTextColor = UIColor.brownColor()
        //        config.menuBackgroundColor = UIColor.lightGrayColor()
        //        config.hidePageIndicator = true
        //        config.realmConfiguration = Realm.Configuration(fileURL: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("highlights.realm"))
        // Custom sharing quote background
        config.quoteCustomBackgrounds = []
        if let image = UIImage(named: "demo-bg") {
            let customImageQuote = QuoteImage(withImage: image, alpha: 0.6, backgroundColor: UIColor.black)
            config.quoteCustomBackgrounds.append(customImageQuote)
        }
        
        let textColor = UIColor(red:0.86, green:0.73, blue:0.70, alpha:1.0)
        let customColor = UIColor(red:0.30, green:0.26, blue:0.20, alpha:1.0)
        let customQuote = QuoteImage(withColor: customColor, alpha: 1.0, textColor: textColor)
        config.quoteCustomBackgrounds.append(customQuote)
        
        return config
    }
    
    fileprivate func open() {
        guard let bookPath = Bundle.main.path(forResource: "archi", ofType: "epub") else {
            return
        }
        print("Opening")
        let readerConfiguration = self.readerConfiguration()
        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: readerConfiguration, shouldRemoveEpub: false)
    }
    
    func setupGridViews() {
        relatedBooksSectionView.sectionHeader.text = "Related Books"
        relatedBooksSectionView.seeAllButton.addTarget(self, action: #selector(onRelatedSeeAllButtonTap), for: .touchUpInside)
        reviewGridView.seeAllButton.addTarget(self, action: #selector(onReviewsSeeAllButtonTap), for: .touchUpInside)
    }
    
    func setupLabels() {
        authorNameLabel.text = book.author
        bookCoverImageView.image = book.cover
        bookTitleLabel.text = book.title
    }
    
    @objc func onRelatedSeeAllButtonTap() {
        
    }
    
    @objc func onReviewsSeeAllButtonTap() {
        let reviewsTableVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardIDs.ReviewsTableViewScene) as! ReviewsTableViewController
        present(reviewsTableVC, animated: true, completion: nil)
    }
}
