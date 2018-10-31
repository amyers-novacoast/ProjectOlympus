//
//  Extensions.swift
//  TableViewTest
//
//  Created by Emily Thomas on 9/23/18.
//  Copyright © 2018 TS Myers. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let testGreen = UIColor().colorFromHex("34E5FF")
    static let testRed = UIColor().colorFromHex("34E5FF")
    static let testPurple = UIColor().colorFromHex("34E5FF")
    static let testBlue = UIColor().colorFromHex("34E5FF")
    
    func colorFromHex(_ hex : String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.black
        }
        var rgb : UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
}

