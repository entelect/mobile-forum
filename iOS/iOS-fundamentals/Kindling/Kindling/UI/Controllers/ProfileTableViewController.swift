import UIKit

enum ProfileTableViewSections: Int, CaseIterable {
    case profile = 0
    case userDetails = 1
    case logout = 2
}

extension ProfileTableViewSections {
    
    var reuseIdentifier: String {
        switch self {
        case .profile:
            return "profileCell"
        case .userDetails:
            return "userDetailCell"
        case .logout:
            return "logoutCell"
        }
    }
}

enum UserDetailsTableViewRow: Int, CaseIterable {
    case email = 0
    case age = 1
    case gender = 2
    case preference = 3
}

extension UserDetailsTableViewRow {
    
    var heading: String {
        switch self {
        case .email:
            return "Email"
        case .age:
            return "Age"
        case .gender:
            return "Gender"
        case .preference:
            return "Dating Preference"
        }
    }
    
    func value(for user: KindlingUser) -> String {
        switch self {
        case .email:
            return user.emailAddress
        case .age:
            return user.age.stringValue
        case .gender:
            return user.gender.rawValue
        case .preference:
            return user.datingPreference.rawValue
        }
    }
}

fileprivate extension Int {
    
    var profileSectionValue: ProfileTableViewSections {
        return ProfileTableViewSections(rawValue: self)!
    }
    
    var userDetailsRowValue: UserDetailsTableViewRow {
        return UserDetailsTableViewRow(rawValue: self)!
    }
}

class ProfileTableViewController: UITableViewController {
    
    private let user = InMemoryDatabase.sharedDatabase.currentUser

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: String(describing: UserProfileTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "profileCell")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileTableViewSections.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section.profileSectionValue {
        case .profile:
            return 1
        case .userDetails:
            return UserDetailsTableViewRow.allCases.count
        case .logout:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileSection = indexPath.section.profileSectionValue
        let cell = tableView.dequeueReusableCell(withIdentifier: profileSection.reuseIdentifier, for: indexPath)
        switch profileSection {
        case .profile:
            if let profileCell = cell as? UserProfileTableViewCell {
                profileCell.set(profile: user)
                return profileCell
            }
        case .userDetails:
            let detailRow = indexPath.row.userDetailsRowValue
            cell.textLabel?.text = detailRow.heading
            cell.detailTextLabel?.text = detailRow.value(for: user)
            return cell
        case .logout:
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section.profileSectionValue == .logout {
            showLogoutAlert()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let profileSection = ProfileTableViewSections(rawValue: section)!
        if profileSection == .userDetails {
            return "Your details"
        }
        return nil
    }
    
    // MARK: - Logout
    
    private func showLogoutAlert() {
        let alert = UIAlertController(
            title: "Logging out",
            message: "You are about to log out. Are you sure you want to proceed?",
            preferredStyle: .alert
        )
        alert.addActions([
            UIAlertAction(title: "Logout", style: .destructive, handler: { action in
                self.logoutCurrentUser()
            }),
            UIAlertAction(title: "Cancel", style: .cancel)
        ])
        present(alert, animated: true)
    }
    
    private func logoutCurrentUser() {
        performSegue(withIdentifier: "logoutCurrentUser", sender: self)
    }
}
