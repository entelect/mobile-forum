//
//  CounterView.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/06/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import SwiftUI

struct CounterSwiftUIView: UIViewRepresentable {
    @Binding var count: Int
    
    func makeUIView(context: Context) -> CounterView {
        return CounterView.fromNib()
    }
    
    func updateUIView(_ uiView: CounterView, context: Context) {
        uiView.counterLabel.text = "\(count)"
    }
}

@IBDesignable
class CounterView: UIView {
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var rounded: Bool {
        get {
            return layer.cornerRadius != 0
        }
        set {
            if newValue {
                layer.cornerRadius = frame.width / 2
            } else {
                layer.cornerRadius = 0
            }
        }
    }
}
