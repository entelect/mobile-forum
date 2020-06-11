//
//  LoginViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/04/28.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var biometricsButton: UIButton!
    
    private var loggedIn: Bool = false
    
    class func loadFromStoryBoard() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyling()
        configureLogInStyling()
        configureBackgroundGradient()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func configureStyling() {
        self.view.tintColor = .white
        
        emailTextField.returnKeyType = .done
        passwordTextField.returnKeyType = .done
        
        emailTextField.textColor = .white
        passwordTextField.textColor = .white
        
        emailTextField.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4)
        passwordTextField.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4)
        
        emailTextField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        passwordTextField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        ])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        ])
    }
    
    private func configureLogInStyling() {
        if Authentication.shared.hasCredentials() {
            emailTextField.isHidden = true
            logInButton.setTitle("Log in using password", for: .normal)
        } else {
            biometricsButton.isHidden = true
        }
        
        if Authentication.shared.biometricLoginAvailable() {
            switch Authentication.shared.biometricType {
            case .faceID:
                biometricsButton.setImage(UIImage(named: "FaceID"), for: .normal)
            case .touchID:
                biometricsButton.setImage(UIImage(named: "TouchID"), for: .normal)
            default:
                break
            }
        }
    }
    
    private func configureBackgroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.darkRed().cgColor,
            UIColor.darkBlue().cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
