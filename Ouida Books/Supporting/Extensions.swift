//
//  Extensions.swift
//  Ouida Books
//
//  Created by Jubril on 4/22/18.
//  Copyright © 2018 bitkoin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var pinkishGrey: UIColor {
        return UIColor(white: 197.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var lightgrey: UIColor {
        return UIColor(white: 247.0 / 255.0, alpha: 1.0)
    }
    
}

// Text styles

extension UIFont {
    
    class var navButtonFont: UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: .semibold)
    }

}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.27,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 6,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        shouldRasterize = true
    }
}

extension UIBarButtonItem {
    class func itemWith(colorfulImage: UIImage?, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.setImage(colorfulImage, for: .normal)
        button.contentHorizontalAlignment = .right
        button.frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        button.addTarget(target, action: action, for: .touchUpInside)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}
