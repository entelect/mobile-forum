//
//  MapperOneType.swift
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/09.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

// Has to be of type Int to be used in Obj-C, this means no associated types or other Raw types
@objc enum MapperOneType: Int {
    case swift
    case objC
    
    // Unable to make this into a Obj-C accessable signature
    var title: String {
        switch self {
        case .swift:
            return "One: Swift"
        case .objC:
            return "One: Obj-C"
        }
    }
}
