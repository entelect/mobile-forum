//
//  LoginViewController.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/24.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    private let disposeBag = DisposeBag()

    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet var loginButton: UIBarButtonItem!

    private let loginService: LoginService = StubLoginService()

    @IBAction func onLoginButtonTapped(_ sender: UIBarButtonItem) {
         self.login()
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

    override func viewDidLoad() {
        super.viewDidLoad()

        emailAddressTextField.setBorder(color: .gray)
        passwordTextField.setBorder(color: .gray)

        // TODO: Login button rxTap
//        loginButton.rx.tap.bind(onNext: { [unowned self] in
//            self.login()
//        }).disposed(by: disposeBag)

        // TODO: Email Validation
//        let emailAddress = emailAddressTextField.rx.text.asDriver()
//                .skip(1)
//                .distinctUntilChanged()
//                .debounce(.milliseconds(500))
//
//        let emailAddressIsValid = emailAddress.map { [unowned self] email -> Bool in
//            self.validateEmailAddress(emailAddress: email)
//        }
//
//        emailAddressIsValid.drive(emailAddressTextField.rx.isValid)
//                .disposed(by: disposeBag)
//
//        emailAddressIsValid.drive(onNext: { isValid in self.emailErrorLabel.isHidden = isValid })
//                .disposed(by: disposeBag)
    }

    // TODO: Email Validation
//    private func validateEmailAddress(emailAddress: String?) -> Bool {
//        guard let emailAddress = emailAddress,
//              !emailAddress.isEmpty else {
//            return true
//        }
//
//        if emailAddress.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .regularExpression) == nil {
//            return false
//        }
//
//        return true
//    }

    private func login() {
        guard let email = emailAddressTextField.text, let password = passwordTextField.text else {
            showLoginError()
            return
        }
        let credentials = UserLoginCredentials(emailAddress: email, password: password)
        self.loginService.login(with: credentials) { response in
            if response == .success {
                proceedToDashboard()
            } else {
                showLoginError()
                passwordTextField.text = nil
            }
        }
    }

}
