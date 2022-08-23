//
//  UIImageView+Ext.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 23.08.22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func loadURL(url: String) {
        if let url = URL(string: url) {
            sd_setImage(with: url,
                        placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
