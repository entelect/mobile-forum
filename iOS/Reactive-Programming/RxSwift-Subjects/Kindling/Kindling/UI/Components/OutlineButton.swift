//
//  OutlineButton.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/23.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit

@IBDesignable
class OutlineButton: UIButton {
    
    @IBInspectable
    var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        set {
            if let newColor = newValue {
                layer.borderColor = newColor.cgColor
            }
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
}
