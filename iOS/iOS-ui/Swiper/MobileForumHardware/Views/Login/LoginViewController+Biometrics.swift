//
//  LoginViewController+Biometrics.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/06.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import LocalAuthentication

extension LoginViewController {
    @IBAction func logInTapped(_ sender: Any) {
        credentialLogIn()
    }
    
    @IBAction func biometricsButtonTapped(_ sender: Any) {
        biometricLogIn()
    }
    
    private func biometricLogIn() {
        Authentication.shared.biometricLogIn { [weak self] error in
            if let error = error {
                var message: String
                switch error as? LAError {
                case LAError.authenticationFailed?:
                    message = "There was a problem verifying your identity."
                case LAError.userCancel?:
                    message = "You pressed cancel."
                case LAError.userFallback?:
                    message = "You pressed password."
                case LAError.biometryNotAvailable?:
                    message = "Face ID/Touch ID is not available."
                case LAError.biometryNotEnrolled?:
                    message = "Face ID/Touch ID is not set up."
                case LAError.biometryLockout?:
                    message = "Face ID/Touch ID is locked."
                default:
                    message = error.localizedDescription
                }
                self?.showError(title: "Authenticion failed", message: message)
                return
            }
            self?.navigateToLandingScreen()
        }
    }
    
    private func credentialLogIn() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
                fatalError("Failed to initialize usernameTextField and passwordTextField")
        }
        
        do {
            if Authentication.shared.hasCredentials() {
                if try Authentication.shared.logInExistingUser(password: password) {
                    navigateToLandingScreen()
                } else {
                    showError(title: "Error", message: "Password incorrect")
                }
            } else {
                try Authentication.shared.logInNewUser(email: email, password: password)
                navigateToLandingScreen()
            }
        } catch AuthenticationError.invalidCredentials {
            showError(title: "Invalid credentials", message: "The email you entered doesn't exist or the password is incorrect.")
        } catch KeychainError.unhandledError(let status) {
            debugPrint(status)
        } catch {
            debugPrint(error)
        }
    }
    
    func navigateToLandingScreen() {
        let landingTabBarController = LandingTabBarController.loadFromStoryBoard()
        UIApplication.setRootView(landingTabBarController)
    }
}
