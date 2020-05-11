import UIKit

extension UIAlertController {
    
    func addActions(_ actions: [UIAlertAction]) {
        actions.forEach { addAction($0) }
    }
}
