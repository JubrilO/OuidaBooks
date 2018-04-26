//
//  SponsoredGridView.swift
//  Ouida Books
//
//  Created by Jubril on 4/25/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class SponsoredGridView: UIView, NibLoadable, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var sponsoredButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if collectionView != nil  {
            let cell = UINib(nibName: Constants.CellIdentifiers.SponsoredCell, bundle: nil)
            collectionView.register(cell, forCellWithReuseIdentifier: Constants.CellIdentifiers.SponsoredCell )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.SponsoredCell, for: indexPath) as! SponsoredCell
        return cell
    }
    
    private func randRange (lower: UInt32 , upper: UInt32) -> UInt32 {
        return lower + arc4random_uniform(upper - lower + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = 89/100 * collectionView.bounds.width
        return CGSize(width: cellWidth, height: 298)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    

    
}
