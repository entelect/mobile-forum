//
//  UIView+Extensions.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/06/24.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
