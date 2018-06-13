//
//  ReviewsGridView.swift
//  Ouida Books
//
//  Created by Jubril on 5/15/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class ReviewsGridView: UIView, NibLoadable, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seeAllButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if collectionView != nil {
            let cell = UINib(nibName: Constants.CellIdentifiers.ReviewsCollectionViewCell, bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: Constants.CellIdentifiers.ReviewsCollectionViewCell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.ReviewsCollectionViewCell, for: indexPath) as! ReviewsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = 89/100 * collectionView.bounds.width
        return CGSize(width: cellWidth, height: 205)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    
}
