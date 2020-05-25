import UIKit
import CocoaLumberjack

class KindlingProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var profile: KindlingUser? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = profile else {
            DDLogWarn("Profile is nil")
            return
        }
        profileImageView.load(url: user.imageUrl)
        usernameLabel.text = user.username
        ageLabel.text = user.age.stringValue
    }
}
