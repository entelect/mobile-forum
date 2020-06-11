//
//  SwipeViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/04/30.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import SwiftUI

class SwipeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwipeView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupSwipeView() {
        let swiftUIController = UIHostingController(rootView: SwipeView())

        addChild(swiftUIController)
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(swiftUIController.view)
        
        swiftUIController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        swiftUIController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        swiftUIController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        swiftUIController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        swiftUIController.didMove(toParent: self)
    }
    
}
