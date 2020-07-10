//
//  DateSpotView.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/19.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit

class DateSpotView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static func loadFromNib() -> DateSpotView {
        let nib = UINib(nibName: String(describing: DateSpotView.self), bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! DateSpotView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2
    }
    
    func configure(title: String, description: String, image: UIImage?) {
        titleLabel.text = title
        descriptionLabel.text = description
        imageView.image = image
    }
}
