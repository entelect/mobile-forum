//
//  LandingTabBarController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/04/29.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class LandingTabBarController: UITabBarController {
    class func loadFromStoryBoard() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: LandingTabBarController.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .red
        tabBar.tintColor = .red
        
        BackgroundLocation.shared.startLocationTracking()
    }
}
