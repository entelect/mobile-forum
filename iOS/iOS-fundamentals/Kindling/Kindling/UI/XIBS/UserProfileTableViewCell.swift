import UIKit

class UserProfileTableViewCell: UITableViewCell {
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usernameTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2;
        userImageView.clipsToBounds = true
    }
    
    func set(profile: KindlingUser) {
        userImageView.load(url: profile.imageUrl)
        usernameTextView.text = profile.username
    }
}
