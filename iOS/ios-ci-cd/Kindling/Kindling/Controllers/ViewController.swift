//
//  ViewController.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/08/30.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentEnvironment: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch KindlingEnv.currentEnv {
        case .development:
            currentEnvironment.isHidden = false
            currentEnvironment.text = "Development"
        case .qa:
            currentEnvironment.isHidden = false
            currentEnvironment.text = "QA"
        case .production:
            currentEnvironment.isHidden = true
        }
        currentEnvironment.textColor = isDebug() ? .red : .black
    }
}

