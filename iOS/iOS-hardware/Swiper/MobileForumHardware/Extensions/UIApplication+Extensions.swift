//
//  UIApplication+Extensions.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    public static func setRootView(_ viewController: UIViewController,
                                   options: UIView.AnimationOptions = .transitionCrossDissolve,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.5,
                                   completion: (() -> Void)? = nil) {
        guard animated else {
            keyWindow()?.rootViewController = viewController
            return
        }
        
        if let keyWindow = keyWindow() {
            UIView.transition(with: keyWindow, duration: duration, options: options, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                keyWindow.rootViewController = viewController
                UIView.setAnimationsEnabled(oldState)
            }) { _ in
                completion?()
            }
        }
        
    }
    
    public static func keyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
