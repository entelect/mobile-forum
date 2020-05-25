//
// Created by Kyle Wood on 2020/05/25.
// Copyright (c) 2020 Entelect. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UITextField {
    var isValid: Binder<Bool> {
        Binder(self.base) { (textField: UITextField, isValid: Bool) in
            guard isValid else {
                textField.setBorder(color: .red)
                return
            }

            textField.setBorder(color: .gray)
        }
    }
}

extension UITextField {
    func setBorder(color: UIColor) {
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5
    }
}