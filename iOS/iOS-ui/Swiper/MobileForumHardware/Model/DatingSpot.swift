//
//  DatingSpot.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import CoreLocation

class DatingSpot {
    private(set) var title: String
    private(set) var description: String
    private(set) var coordinate: CLLocationCoordinate2D
    
    init(title: String, description: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.description = description
        self.coordinate = coordinate
    }
}
