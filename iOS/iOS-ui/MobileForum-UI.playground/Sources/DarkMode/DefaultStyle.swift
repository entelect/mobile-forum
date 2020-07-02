import UIKit

public enum DefaultStyle {
    public enum Colors {
        public static let label: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor.label
            } else {
                return .black
            }
        }()
        
        public static var tint: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor { traitCollection in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor(red: 200/255, green: 0, blue: 0, alpha: 1)
                    } else {
                        return UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
                    }
                }
            }else {
                return UIColor.red
            }
        }()
    }
}
