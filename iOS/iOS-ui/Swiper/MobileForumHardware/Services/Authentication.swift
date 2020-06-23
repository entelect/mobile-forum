//
//  Authentication.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/04/28.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import LocalAuthentication

enum AuthenticationError: Error {
    case invalidCredentials
}

class Authentication {
    static let shared = Authentication()
    private let context = LAContext()
    
    private init() {}
    
    var biometricType: LABiometryType {
        return context.biometricType
    }
    
    func biometricLoginAvailable() -> Bool {
        return hasCredentials() && biometricType != .none
    }
    
    func biometricLogIn(completion: @escaping (Error?) -> ()) {
        var error: NSError?
        let reason = "Log in to your account"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (_, authenticationError) in
                DispatchQueue.main.async {
                    completion(authenticationError)
                }
            }
        } else {
            completion(error)
        }
    }
    
    func logInNewUser(email: String, password: String) throws {
        guard let user = InMemoryDatabase.shared.users.first(where: {$0.email == email}),
            user.password == password else {
            throw AuthenticationError.invalidCredentials
        }
        try KeyChainAuthentication.addCredentials(account: email, password: password)
    }
   
    func logInExistingUser(password: String) throws -> Bool {
        let credentials = try KeyChainAuthentication.queryCredentials()
        return credentials.password == password
    }
    
    func hasCredentials() -> Bool {
        return KeyChainAuthentication.hasCredentials()
    }
    
    func logOut() throws {
        try KeyChainAuthentication.removeCredentials()
    }
}

struct Credentials {
    var email: String
    var password: String
}

