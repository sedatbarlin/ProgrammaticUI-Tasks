//
//  UIFont+Ext.swift
//  Login&RegisterUI-2
//
//  Created by Sedat on 29.10.2025.
//

import UIKit

extension UIFont {
    class func manropeBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Manrope-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func manropeLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Manrope-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func manropeMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Manrope-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func manropeRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Manrope-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func manropeSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Manrope-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
