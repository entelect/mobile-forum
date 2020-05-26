//
// Created by Kyle Wood on 2020/05/25.
// Copyright (c) 2020 Entelect. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MatchingService {

    private var currentIndex = 0
    private let currentUser: KindlingUser
    private var stubbedUsers: [KindlingUser] = []
    private let disposeBag = DisposeBag()

    var matches: BehaviorSubject<KindlingUser?>!

    init(for user: KindlingUser) {
        currentUser = user
        stubbedUsers = stubUsers
        stubbedUsers.removeAll(where: { $0.id == user.id })
        matches = BehaviorSubject(value: stubbedUsers.first)
    }

    func fetchNewMatch() {
        guard currentIndex < stubbedUsers.count else {
            return
        }
        matches.onNext(stubbedUsers[currentIndex])
        currentIndex += 1
    }
}