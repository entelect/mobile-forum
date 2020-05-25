//
//  DashboardViewController.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/24.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit
import CocoaLumberjack
import RxSwift
import RxCocoa
import RxGesture

class DashboardViewController: UIViewController {

    @IBOutlet var profileCard: UIView!
    @IBOutlet var fireButton: UIButton!
    @IBOutlet var interestButton: UIButton!
    @IBOutlet var dismissButton: UIButton!

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileUsername: UILabel!
    @IBOutlet var profileAge: UILabel!

    private var matches: [KindlingUser] = []
    private var currentMatchIndex: Int = 0
    private let disposeBag = DisposeBag()
    private var matchingService: MatchingService!
    fileprivate var currentMatch: KindlingUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        [fireButton, interestButton, dismissButton].forEach { button in
            button?.imageView?.contentMode = .scaleAspectFit
        }

        let user = InMemoryDatabase.sharedDatabase.currentUser
        matchingService = MatchingService(for: user)

        for match in user.matchingProfiles {
            matches.append(match)
        }
        if matches.isEmpty {
            profileCard.isHidden = true
        } else {
            displayMatch(matches[currentMatchIndex])
        }

        //TODO profile card tap gesture recognizer
        setupTapGestureRecognizer()
//        profileCard.rx.tapGesture().bind(onNext: { [unowned self] _ in
//            self.profileCard.isUserInteractionEnabled = true
//            self.onProfileTapped()
//        }).disposed(by: disposeBag)

        // TODO: Swipe right to add to matches, swipe left to load new
//        profileCard.rx.swipeGesture([.left, .right]).bind (onNext: { [unowned self] _ in
//            self.getNewMatch()
//        }).disposed(by: disposeBag)

        // TODO matching service
//        matchingService.matches.asDriver(onErrorDriveWith: .empty())
//                .drive(self.rx.profileData)
//                .disposed(by: disposeBag)
//
//        matchingService.fetchNewMatch()
//
//        fireButton.rx.tap.bind(onNext: getNewMatch).disposed(by: disposeBag)
//        interestButton.rx.tap.bind(onNext: getNewMatch).disposed(by: disposeBag)
//        dismissButton.rx.tap.bind(onNext: getNewMatch).disposed(by: disposeBag)
    }

    private func setupTapGestureRecognizer() {
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(onProfileTapped))
        profileCard.isUserInteractionEnabled = true
        profileCard.addGestureRecognizer(tapGestureRecogniser)
    }

    @objc func onProfileTapped() {
        DDLogInfo("User viewing profile")
        performSegue(withIdentifier: "showUserProfile", sender: self)
    }

    func ProfileTapped() {
        DDLogInfo("User viewing profile")
        performSegue(withIdentifier: "showUserProfile", sender: self)
    }

    private func displayMatch(_ match: KindlingUser) {
        profileImageView.image = nil
        profileImageView.load(url: match.imageUrl)
        profileUsername.text = match.username
        profileAge.text = match.age.stringValue
    }

    @IBAction func onFireTapped(_ sender: UIButton) {
        currentMatchIndex += 1
        if currentMatchIndex < matches.count {
            displayMatch(matches[currentMatchIndex])
        }
    }

    @IBAction func onDismissTapped(_ sender: UIButton) {
        currentMatchIndex += 1
        if currentMatchIndex < matches.count {
            displayMatch(matches[currentMatchIndex])
        }
    }

    @IBAction func onInterestTapped(_ sender: UIButton) {
        currentMatchIndex += 1
        if currentMatchIndex < matches.count {
            displayMatch(matches[currentMatchIndex])
        }
    }


    @IBAction func onProfileClosed(_ segue: UIStoryboardSegue) {
        // Do nothing
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let match = currentMatch else {
//            return
//        }
        if let segueIdentifier = segue.identifier, segueIdentifier == "showUserProfile" {
            if let navController = segue.destination as? UINavigationController, let controller = navController.topViewController as? KindlingProfileViewController {
                controller.profile = matches[currentMatchIndex]
                //controller.profile = match
            }

        }
    }

    private func getNewMatch() {
        matchingService.fetchNewMatch()
    }
}

fileprivate extension KindlingUser {

    var matchingProfiles: [KindlingUser] {
        return stubUsers.filter {
            $0.id != self.id
        }.filter {
            self.datingPreference.isCompatible(withGender: $0.gender)
        }
    }
}

extension Reactive where Base: DashboardViewController {
    var profileData: Binder<KindlingUser?> {
        Binder(base.self) { vc, newMatch in
            guard let newMatch = newMatch else {
                return
            }

            vc.currentMatch = newMatch
            vc.profileImageView.image = nil
            vc.profileImageView.load(url: newMatch.imageUrl)
            vc.profileUsername.text = newMatch.username
            vc.profileAge.text = newMatch.age.stringValue
        }
    }
}
