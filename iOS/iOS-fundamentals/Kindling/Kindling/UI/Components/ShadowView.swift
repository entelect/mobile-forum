//
//  ShadowView.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/24.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable
    var dropShadowEnabled: Bool = false {
        didSet {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 1
            layer.shadowOffset = .zero
            layer.shadowRadius = 10
        }
    }
}
