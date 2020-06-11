//
//  User.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation

enum UserStatus {
    case like
    case superLike
    case reject
    case none
}

enum UserGender: String {
    case male = "Male"
    case female = "Female"
}

class User: Identifiable, ObservableObject {
    private(set) var email: String
    private(set) var password: String
    private(set) var name: String
    private(set) var surname: String
    private(set) var profileImage: String
    private(set) var age: Int
    private(set) var gender: UserGender
    @Published private(set) var superLikes: Int = 0
    private(set) var admin: Bool
    @Published private(set) var status: UserStatus = .none
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    init(email: String, password: String, name: String, surname: String, profileImage: String, age: Int, gender: UserGender, admin: Bool = false) {
        self.email = email
        self.password = password
        self.name = name
        self.surname = surname
        self.profileImage = profileImage
        self.age = age
        self.gender = gender
        self.admin = admin
    }
    
    func increaseSuperLikes(by likes: Int) {
        DispatchQueue.main.async {
            self.superLikes += likes
        }
    }
    
    func configure(status: UserStatus) {
        self.status = status
    }
}
