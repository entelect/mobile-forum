//
//  UIViewController+Extensions.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertViewController.addAction(okAction)
            self.present(alertViewController, animated: true)
        }
    }
    
    func showError(title: String, message: String) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertViewController.addAction(okAction)
            self.present(alertViewController, animated: true)
        }
    }
    
    func showConfirmation(title: String, message: String, yesAction: ((UIAlertAction) -> Void)?) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default, handler: yesAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertViewController.addAction(yesAction)
            alertViewController.addAction(cancelAction)
            self.present(alertViewController, animated: true)
        }
    }
}
