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
        uiView.configure(count: count)
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
    var rounded: Bool = false {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if rounded {
            layer.cornerRadius = frame.width / 2
        } else {
            layer.cornerRadius = 0
        }
    }
    
    private var count: Int?
    
    func configure(count: Int) {
        counterLabel.text = "\(count)"
        
        if self.count != count {
            self.count = count
            
            
            animateUsingKeyFrame()
        }
    }
    
    func animateUsingUIView() {
        let originalBackgroundColor = backgroundColor
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.counterLabel.alpha = 1
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
            self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        })
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 0.8, y: 0.8)
            self.backgroundColor = originalBackgroundColor
        })
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        })
    }
    
    func animateUsingKeyFrame() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.counterLabel.alpha = 1
        })
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.values = [
            CATransform3DScale(layer.transform, 1, 1, 1),
            CATransform3DScale(layer.transform, 1.2, 1.2, 1.2),
            CATransform3DScale(layer.transform, 0.8, 0.8, 0.8),
            CATransform3DScale(layer.transform, 1.0, 1.0, 1.0)
        ]
        let keyTimes: [NSNumber] = [0, 0.33, 0.67, 1]
        
        animation.keyTimes = keyTimes
        animation.timingFunctions = [
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeIn),
            CAMediaTimingFunction(name: .easeInEaseOut),
            CAMediaTimingFunction(name: .easeOut)
        ]
        
        animation.duration = 1.5

        layer.add(animation, forKey: "valueChanged")
    }
}
