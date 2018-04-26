//
//  OuidaTextField.swift
//  Ouida Books
//
//  Created by Jubril on 4/20/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import UIKit

class OuidaTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    private func newBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += padding.left
        newBounds.origin.y += padding.top
        newBounds.size.height -= padding.top + padding.bottom
        newBounds.size.width -= padding.left + padding.right
        return newBounds
    }
}
