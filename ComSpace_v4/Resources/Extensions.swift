//
//  Extensions.swift
//  ComSpace_v4
//
//  Created by Зарина Умурзакова on 29.11.2021.
//

import Foundation
import UIKit

extension UIView{
    public var width: CGFloat{
        return self.frame.size.width
    }
    public var height: CGFloat{
        return self.frame.size.height
    }
    public var top: CGFloat{
        return self.frame.origin.y
    }
    public var bottom: CGFloat{
        return self.frame.size.height + self.frame.origin.y
    }
    public var left: CGFloat{
        return self.frame.origin.x
    }
    public var right: CGFloat{
        return self.frame.size.width + self.frame.origin.x
    }
}

extension UIColor {
  static let themeColor = UIColor(red: 210.0/255.0, green: 105.0/255.0, blue: 130.0/255.0, alpha: 1.0)
    // orange
    static let primaryColor = UIColor(red: 235.0/255.0, green: 137.0/255.0, blue: 20.0/255.0, alpha: 1.0)
    // black
    static let secondaryColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    static let LabelGray = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.25)
}

extension UIFont{
    static func mulishRegular(size: CGFloat) -> UIFont?{
        return UIFont(name: "Mulish-Regular", size: 34)
    }
    static func mulishBold(size: CGFloat) -> UIFont?{
        return UIFont(name: "Mulish-Bold", size: 34)
    }
    static func mulishItalic(size: CGFloat) -> UIFont?{
        return UIFont(name: "Mulish-Italic", size: 34)
    }
}
