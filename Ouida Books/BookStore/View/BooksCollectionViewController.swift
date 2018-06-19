//
//  BooksCollectionViewController.swift
//  Ouida Books
//
//  Created by Jubril on 15/06/2018.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit
import FolioReaderKit

class BooksCollectionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: Constants.CellIdentifiers.BookCoverCell, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifiers.BookCoverCell)
        }
    }
    
    let books: [Book] = [Book(author: "Nnedi Okorafor", title: "Who Fears Death", cover: #imageLiteral(resourceName: "book3")), Book(author: "Odafe Atogun", title: "Taduno's Song", cover: #imageLiteral(resourceName: "book1")), Book(author: "Hadiza Isma El-Rufai" , title: "An Abundance of Scorpions", cover: #imageLiteral(resourceName: "book2"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.setCharacterSpacing(1)
    }

    @IBAction func onBackButtonTap(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    private func randRange (lower: UInt32 , upper: UInt32) -> UInt32 {
        return lower + arc4random_uniform(upper - lower + 1)
    }
  
}

extension BooksCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.BookCoverCell, for: indexPath) as! BookCollectionViewCell
        
        let book = books[Int(randRange(lower: 0, upper: 2))]
        cell.shadowView.layer.applySketchShadow()
        cell.authorNameLabel.text = book.author
        cell.bookCoverImage.image = book.cover
        cell.bookTitleLabel.text = book.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = books[Int(randRange(lower: 0, upper: 2))]
        let bookDetailViewController = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardIDs.BookDetailsScene) as! BookDetailsViewController
        bookDetailViewController.book = selectedBook
        present(bookDetailViewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30/667 * view.bounds.height, left: 28/336 * collectionView.bounds.width, bottom: 30/667 * view.bounds.height, right: 28/336 * collectionView.bounds.width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let aspectRatio: CGFloat = 120.0/203.0
        let bookWidthPercentage: CGFloat = 35.7/100.0
        let bookWidth = collectionView.bounds.width * bookWidthPercentage
        var bookHeight = bookWidth / aspectRatio
        if view.bounds.width == 320 {
         bookHeight = (bookWidth / aspectRatio) + 30
        }        
        return CGSize(width: bookWidth, height: bookHeight)
        
    }
}
