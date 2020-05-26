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

    // TODO : 1 - Comment this out
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

        // TODO : 1 - Uncomment this
//        loginButton.rx.tap.bind(onNext: { [unowned self] in
//            self.login()
//        }).disposed(by: disposeBag)

        // TODO: 2 - Uncomment this
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
//        emailAddressIsValid.drive(emailErrorLabel.rx.isHidden)
//                .disposed(by: disposeBag)


        // TODO: 3: uncomment this
//        passwordTextField.rx.controlEvent(.editingDidEndOnExit)
//                .bind(onNext: login)
//                .disposed(by: disposeBag)

        // TODO: 4 uncomment this
//        let password = passwordTextField.rx.text.asDriver()
//                .skip(1)
//                .distinctUntilChanged()
//                .debounce(.milliseconds(500))
//
//        let passwordIsValid = password.map { (password: String?) -> Bool in
//            guard let password = password, !password.isEmpty else {
//                return false
//            }
//            return true
//        }
//
//        let inputValid = Driver.combineLatest(
//                emailAddressIsValid,
//                passwordIsValid,
//                resultSelector: { $0 && $1 }
//        )
//
//        Driver<Bool>.merge(Driver<Bool>.just(false), inputValid)
//                .drive(loginButton.rx.isEnabled)
//                .disposed(by: disposeBag)
    }

    private func validateEmailAddress(emailAddress: String?) -> Bool {
        guard let emailAddress = emailAddress,
              !emailAddress.isEmpty else {
            return true
        }

        if emailAddress.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .regularExpression) == nil {
            return false
        }

        return true
    }

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

fileprivate extension Reactive where Base: UIBarButtonItem {
    var isEnabled: Binder<Bool> {
        Binder(base.self) { button, isEnabled in
            button.isEnabled = isEnabled
        }
    }
}
