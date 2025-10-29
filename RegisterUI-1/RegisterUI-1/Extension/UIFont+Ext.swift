//
//  UIFont+Ext.swift
//  RegisterUI-1
//
//  Created by Sedat on 16.10.2025.
//

import UIKit

extension UIFont {
    class func rubikBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    class func rubikLight(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func rubikMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func rubikRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func rubikSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
