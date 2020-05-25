//
//  DashboardViewController.swift
//  Kindling
//
//  Created by Christopher Araujo on 2020/04/24.
//  Copyright © 2020 Entelect. All rights reserved.
//

import UIKit
import CocoaLumberjack

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [fireButton, interestButton, dismissButton].forEach { button in
            button?.imageView?.contentMode = .scaleAspectFit
        }
        setupTapGestureRecognizer()
        let user = InMemoryDatabase.sharedDatabase.currentUser
        for match in user.matchingProfiles {
            matches.append(match)
        }
        if matches.isEmpty {
            profileCard.isHidden = true
        } else {
            displayMatch(matches[currentMatchIndex])
        }
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
        if let segueIdentifier = segue.identifier, segueIdentifier == "showUserProfile" {
            if let navController = segue.destination as? UINavigationController, let controller = navController.topViewController as? KindlingProfileViewController {
                controller.profile = matches[currentMatchIndex]
            }
            
        }
    }
}

fileprivate extension KindlingUser {
    
    var matchingProfiles: [KindlingUser] {
        return stubUsers.filter { $0.id != self.id }.filter { self.datingPreference.isCompatible(withGender: $0.gender) }
    }
}
