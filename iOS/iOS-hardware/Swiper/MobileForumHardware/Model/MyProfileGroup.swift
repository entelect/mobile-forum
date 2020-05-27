//
//  MyProfileGroup.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

class MyProfileGroup {
    private(set) var title: String
    private(set) var items: [MyProfileItem]
    
    init(title: String, items: [MyProfileItem]) {
        self.title = title
        self.items = items
    }
}
