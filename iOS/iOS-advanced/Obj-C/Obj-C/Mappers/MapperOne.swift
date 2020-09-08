//
//  MapperOne.swift
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/08.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

@objcMembers
// Needs to inherit from NSObject to be available in Obj-C
class MapperOne: NSObject {
    private static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @objc(formatForDate:)
    static func format(for date: Date) -> String? {
        formatter.string(from: date)
    }
    
    static func title(oneType type: MapperOneType) -> String {
        type.title
    }
    
    static func title(twoType type: MapperTwoType) -> String {
        MapperTwo.title(for: type)
    }
}

@objc
// Has to be of type Int to be used in Obj-C, this means no associated types or other Raw types
enum MapperOneType: Int {
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
