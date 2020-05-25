import UIKit
import CocoaLumberjack

class ViewController: UIViewController {
    
    @IBAction func cancelLogin(_ segue: UIStoryboardSegue) {
        DDLogInfo("User cancelled login")
    }
    
    @IBAction func onLogout(_ segue: UIStoryboardSegue) {
        InMemoryDatabase.sharedDatabase.clear()
        DDLogInfo("User logged out")
    }
}
