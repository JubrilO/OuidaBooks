//
//  Book.swift
//  Ouida Books
//
//  Created by Jubril on 4/24/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import Foundation
import UIKit

class Book {
    
    var author: String
    var title: String
    var cover: UIImage
    
    init(author: String, title: String, cover: UIImage) {
        self.author = author
        self.title = title
        self.cover = cover
    }
}
