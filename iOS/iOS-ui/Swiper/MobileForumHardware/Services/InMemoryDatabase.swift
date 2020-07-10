//
//  UserManager.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import Foundation
import CoreLocation

class InMemoryDatabase {
    static let shared = InMemoryDatabase()
    
    private init() {}
    
    var currentUser: User? {
        guard let credentials = try? KeyChainAuthentication.queryCredentials() else {
            return nil
        }
        return users.first(where: { $0.email == credentials.email })
    }
    
    private(set) var users: [User] = [
        User(email: "test1@gmail.com", password: "test1", name: "Piet", surname: "Pompies", profileImage: "https://picsum.photos/400/800", age: 25, gender: .male, admin: true),
        User(email: "test2@gmail.com", password: "test2", name: "Greta", surname: "Pompies", profileImage: "https://picsum.photos/400/800", age: 20, gender: .female),
        User(email: "test3@gmail.com", password: "test3", name: "Armand", surname: "Kamffer", profileImage: "https://picsum.photos/400/800", age: 22, gender: .male),
        User(email: "test4@gmail.com", password: "test4", name: "Christine", surname: "Pompies", profileImage: "https://picsum.photos/400/800", age: 28, gender: .female),
        User(email: "test5@gmail.com", password: "test5", name: "Adriaanus", surname: "Pompies", profileImage: "https://picsum.photos/400/800", age: 21, gender: .male)
    ]
    
    var usersWithoutCurrentProfile: [User] {
        guard let currentUser = self.currentUser else {
            return users
        }
        return users.filter { $0.email != currentUser.email }
    }
    
    private(set) var dateLocations: [DatingSpot] = [
        DatingSpot(title: "Haunted house", description: "Talk to reception for tag location.", coordinate:
            CLLocationCoordinate2D(latitude: -25.862822, longitude: 28.183161)),
        DatingSpot(title: "Test location", description: "Test location.", coordinate:
            CLLocationCoordinate2D(latitude: -25.862884521484375, longitude: 28.18291093281551)),
        DatingSpot(title: "Spa", description: "Talk to reception for tag location.", coordinate:
        CLLocationCoordinate2D(latitude: -25.863307, longitude: 28.183046))
    ]
}
