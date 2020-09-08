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
    @IBOutlet weak var swiftObjCEnumLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: Any) {
        swiftDateLabel.text = "Swift date: \(MapperOne.format(for: Date()) ?? "No value")"
        objDateLabel.text = "Obj-C date: \(MapperTwo.format(for: Date()) ?? "No value")"
        
        swiftObjCDateLabel.text = "Swift -> Obj-C date: \(MapperTwo.formatSwift(for: Date()) ?? "No value")"
        objCExtensionDateLabel.text = "Obj-C Extension date: \(MapperTwo.formatExtension(for: Date()) ?? "No value")"
        
        swiftEnumLabel.text = "Swift enum: \(MapperOne.title(oneType: .swift))"
        objCSwiftEnumLabel.text = "Obj-C -> Swift enum: \(MapperOne.title(twoType: .swift))"
        
        objCEnumLabel.text = "Obj-C enum: \(MapperTwo.title(for: .objC))"
        swiftObjCEnumLabel.text = "Swift -> Obj-C enum: \(MapperTwo.title(for: .objC))"
    }
    
}
