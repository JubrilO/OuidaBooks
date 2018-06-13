//
//  StoreViewController.swift
//  Ouida Books
//
//  Created by Jubril on 4/22/18.
//

import Foundation
import UIKit
import FSPagerView

class StoreViewController: UIViewController {
    
    @IBOutlet weak var topPicksGrid: StoreGridSection!
    @IBOutlet weak var foryouGrid: StoreGridSection!
    @IBOutlet weak var pagerView: FSPagerView!
    var categoriesNavButton = UIBarButtonItem()
    let pageControl = FSPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    @IBOutlet weak var booksNavButton: UIBarButtonItem!
    @IBOutlet weak var audioBooksNavButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        createBarButtonItems()
        topPicksGrid.delegate = self
        foryouGrid.delegate = self
        setupPagerView()
    }
    
    
    func setupPagerView() {
        let pageControl = FSPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: pagerView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: -11).isActive = true
        pageControl.setFillColor(.gray, for: .normal)
        pageControl.setFillColor(.white, for: .selected)
        view.layoutIfNeeded()
    }
    
    func createBarButtonItems() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        booksNavButton.tintColor = UIColor.black
        audioBooksNavButton.tintColor = UIColor.pinkishGrey
        categoriesNavButton = UIBarButtonItem.itemWith(colorfulImage: UIImage(named: "categoriesIcon"), target: self, action: #selector(onCategoriesButtonTap))
        booksNavButton.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.navButtonFont,
            ], for: .normal)
        audioBooksNavButton.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.navButtonFont,
            ], for: .normal)
        navigationItem.setRightBarButton(categoriesNavButton, animated: true)
    }
    
    @objc func onCategoriesButtonTap() {
        
    }
}

extension StoreViewController: GridSectionDelegate {
    func didSelectBook(selectedBook: Book) {
        let BookStoreStoryboard = UIStoryboard(name: Constants.StoryboardNames.BookStore, bundle: nil)
        let bookDetailViewController = BookStoreStoryboard.instantiateViewController(withIdentifier: Constants.StoryboardIDs.BookDetailsScene) as! BookDetailsViewController
        bookDetailViewController.book = selectedBook
        navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
}

extension StoreViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        pageControl.numberOfPages = 5
        return 5
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: "cover")
        return cell
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
    
}
