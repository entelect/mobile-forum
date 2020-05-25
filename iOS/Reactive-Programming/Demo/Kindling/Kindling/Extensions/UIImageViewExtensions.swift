import UIKit
import CocoaLumberjack
import RxCocoa
import RxSwift

extension UIImageView {

    static let loadingViewTag = 901234

    func addLoadingView() {
        if loadingIndicator != nil {
            return
        }
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        indicator.tag = UIImageView.loadingViewTag
        addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    func removeLoadingView() {
        if let loading = loadingIndicator {
            loading.stopAnimating()
            loading.removeFromSuperview()
        }
    }

    private var loadingIndicator: UIActivityIndicatorView? {
        return viewWithTag(UIImageView.loadingViewTag) as? UIActivityIndicatorView
    }

    func load(url urlStr: String) {
        addLoadingView()
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlStr) else {
                DDLogError("URL string \(urlStr) is not valid")
                return
            }
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                    self?.removeLoadingView()
                }
            } else {
                DDLogWarn("Could not render image with URL \(urlStr)")
                DispatchQueue.main.async {
                    self?.removeLoadingView()
                }
            }
        }
    }
}