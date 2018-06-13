//
//  StoreGridSection.swift
//  Ouida Books
//
//  Created by Jubril on 4/23/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

protocol GridSectionDelegate {
    func didSelectBook(selectedBook: Book)
}
class StoreGridSection: UIView, NibLoadable, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
 
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var sectionHeader: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: GridSectionDelegate?
    
    let books: [Book] = [Book(author: "Nnedi Okorafor", title: "Who Fears Death", cover: #imageLiteral(resourceName: "book3")), Book(author: "Odafe Atogun", title: "Taduno's Song", cover: #imageLiteral(resourceName: "book1")), Book(author: "Hadiza Isma El-Rufai" , title: "An Abundance of Scorpions", cover: #imageLiteral(resourceName: "book2"))]
    
    
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
        let cell = UINib(nibName: "BookCoverCell", bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: "BookCoverCell")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCoverCell", for: indexPath) as! BookCollectionViewCell
        
        let book = books[Int(randRange(lower: 0, upper: 2))]
        cell.shadowView.layer.applySketchShadow()
        cell.authorNameLabel.text = book.author
        cell.bookCoverImage.image = book.cover
        cell.bookTitleLabel.text = book.title
        return cell
    }
    
    private func randRange (lower: UInt32 , upper: UInt32) -> UInt32 {
        return lower + arc4random_uniform(upper - lower + 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 203)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = books[indexPath.item]
        delegate?.didSelectBook(selectedBook: selectedBook)
    }
    
}
