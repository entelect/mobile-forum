//
//  ViewController.swift
//  Obj-C
//
//  Created by Armand Kamffer on 2020/09/07.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swiftDateLabel: UILabel!
    @IBOutlet weak var objDateLabel: UILabel!
    @IBOutlet weak var swiftObjCDateLabel: UILabel!
    @IBOutlet weak var objCExtensionDateLabel: UILabel!
    @IBOutlet weak var swiftEnumLabel: UILabel!
    @IBOutlet weak var objCSwiftEnumLabel: UILabel!
    @IBOutlet weak var objCEnumLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: Any) {
        swiftDateLabel.text = "Swift date:\n \(MapperOne.format(for: Date()) ?? "No value")"
        objDateLabel.text = "Obj-C date:\n \(NSMapperTwo.format(for: Date()) ?? "No value")"
        
        
        swiftObjCDateLabel.text = "Swift -> Obj-C date:\n \(NSMapperTwo.format(forSwift: Date()) ?? "No value")"
        objCExtensionDateLabel.text = "Obj-C Extension date:\n \(NSMapperTwo.formatExtension(for: Date()) ?? "No value")"
        
        
        MapperOne.title(oneType: .swift) { [weak self] title in
            self?.swiftEnumLabel.text = "Swift enum:\n \(title)"
        }
        MapperOne.title(twoType: .swift) { [weak self] title in
            self?.objCSwiftEnumLabel.text = "Obj-C -> Swift enum:\n \(title)"
        }

        
        NSMapperTwo.title(for: MapperTwoType.objC) { [weak self] title in
            self?.objCEnumLabel.text = "Obj-C enum:\n \(title)"
        }
    }
}
