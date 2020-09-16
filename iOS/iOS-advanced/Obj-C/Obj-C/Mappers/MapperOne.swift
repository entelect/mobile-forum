//
//  MapperOne.swift
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/08.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

// Needs to inherit from NSObject to be available in Obj-C
@objc class MapperOne: NSObject {
    private static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @objc(formatForDate:)
    static func format(for date: Date) -> String? {
        formatter.string(from: date)
    }
    
    @objc static func title(oneType type: MapperOneType, completion: (String) -> Void) {
        completion(type.title)
    }
    
    static func title(twoType type: MapperTwoType, completion: @escaping (String) -> Void) {
        NSMapperTwo.title(for: type) { title in
            completion(title)
        }
    }
}
