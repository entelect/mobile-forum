//
//  LoginViewController.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/24.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIBarButtonItem!
    
    private let loginService: LoginService = StubLoginService()
    
    @IBAction func onLoginButtonTapped(_ sender: UIBarButtonItem) {
        guard let email = emailAddressTextField.text, let password = passwordTextField.text else {
            showLoginError()
            return
        }
        let credentials = UserLoginCredentials(emailAddress: email, password: password)
        loginService.login(with: credentials) { response in
            if response == .success {
                proceedToDashboard()
            } else {
                showLoginError()
                passwordTextField.text = nil
            }
        }
    }
    
    private func proceedToDashboard() {
        performSegue(withIdentifier: "showDashboard", sender: self)
    }
    
    private func showLoginError() {
        let alert = UIAlertController(
            title: "Login failed",
            message: "The credentials you provided are incorrect. Please try again.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
