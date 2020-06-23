//
//  MyProfileViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var nfcService: NFCWriter?
    
    private lazy var groups: [MyProfileGroup] = {
        return mapGroups()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "My profile"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
    
    private func logOut() {
        showConfirmation(title: "Log Out", message: "Are you sure you want to log out?") { [weak self] _ in
            do {
                try Authentication.shared.logOut()
                let loginViewController = LoginViewController.loadFromStoryBoard()
                UIApplication.setRootView(loginViewController)
            } catch {
                self?.showError(title: "Log out failed", message: error.localizedDescription)
            }
        }
    }
    
    private func writeToNfcTag() {
        nfcService = NFCWriter { (title, message) in
            self.showError(title: title, message: message)
        }
        nfcService?.beginWritingSession(message: "NFC Tag Message")
    }
}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groups[section].title
    }
    
    //TODO: Have option for ARKit demo and do moon example or distance measure example
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let item = groups[indexPath.section].items[indexPath.row]
        item.configure(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = groups[indexPath.section].items[indexPath.row]
        item.tap()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyProfileViewController {
    private func mapGroups() -> [MyProfileGroup] {
        var groups = [MyProfileGroup]()
        groups.append(mapAccountGroup())
        
        if InMemoryDatabase.shared.currentUser?.admin ?? false {
            groups.append(mapAdminGroup())
        }
        
        groups.append(mapArKitGroup())
        return groups
    }
    
    private func mapAccountGroup() -> MyProfileGroup {
        return MyProfileGroup(title: "Account", items: [
            MyProfileItem(cellConfiguration: { cell in
                cell.textLabel?.text = InMemoryDatabase.shared.currentUser?.fullName ?? "No current user"
                cell.isUserInteractionEnabled = false
            }, tapAction: {}),
            MyProfileItem(cellConfiguration: { cell in
                cell.textLabel?.text = "Log out"
                cell.textLabel?.textColor = .red
            }, tapAction: { [weak self] in
                self?.logOut()
            })
        ])
    }
    
    private func mapAdminGroup() -> MyProfileGroup {
        return MyProfileGroup(title: "Admin", items: [
            MyProfileItem(cellConfiguration: { cell in
                cell.textLabel?.text = "Write to NFC tag"
                cell.textLabel?.textColor = .red
            }, tapAction: { [weak self] in
                self?.writeToNfcTag()
            })
        ])
    }
    
    private func mapArKitGroup() -> MyProfileGroup {
        return MyProfileGroup(title: "Hardware examples", items: [
            MyProfileItem(cellConfiguration: { cell in
                cell.textLabel?.text = "ARKit Example"
                cell.textLabel?.textColor = .red
                cell.accessoryType = .disclosureIndicator
            }, tapAction: { [weak self] in
                self?.performSegue(withIdentifier: "showSceneKit", sender: nil)
            }),
            MyProfileItem(cellConfiguration: { cell in
                cell.textLabel?.text = "CoreMotion Example"
                cell.textLabel?.textColor = .red
                cell.accessoryType = .disclosureIndicator
            }, tapAction: { [weak self] in
                self?.performSegue(withIdentifier: "showCoreMotionViewController", sender: nil)
            })
        ])
    }
}
