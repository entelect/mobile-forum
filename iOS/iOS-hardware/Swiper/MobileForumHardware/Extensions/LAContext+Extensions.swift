//
//  LAContext+Extensions.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/04/29.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import LocalAuthentication

extension LAContext {
    var biometricType: LABiometryType {
        var error: NSError?

        guard self.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }

        let _ = canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        return biometryType
    }
}
