//
//  MyProfileItem.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class MyProfileItem {
    private var cellConfiguration: (UITableViewCell) -> ()
    private var tapAction: () -> ()
    
    func configure(cell: UITableViewCell) {
        cellConfiguration(cell)
    }
    
    func tap() {
        tapAction()
    }
    
    init(cellConfiguration: @escaping (UITableViewCell) -> (), tapAction: @escaping () -> ()) {
        self.cellConfiguration = cellConfiguration
        self.tapAction = tapAction
    }
}
