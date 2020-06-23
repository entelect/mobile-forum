//
//  Double+Extensions.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/19.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
