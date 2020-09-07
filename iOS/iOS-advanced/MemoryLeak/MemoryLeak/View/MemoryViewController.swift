//
//  ViewController.swift
//  MemoryLeak
//
//  Created by Armand Kamffer on 2020/07/22.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    private var viewModel: MemoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MemoryViewModel(delegate: self)
        
        viewModel?.errorHandler = {
            self.statusLabel.text = "Error"
        }
    }
}

extension MemoryViewController: Service {
    func eventOccurred() {
        statusLabel.text = "Event fired"
    }
}
