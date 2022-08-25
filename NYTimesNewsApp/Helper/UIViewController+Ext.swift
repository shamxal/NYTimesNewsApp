//
//  UIViewController+Ext.swift
//  NYTimesNewsApp
//
//  Created by Shamkhal Guliyev on 25.08.22.
//

import Foundation
import UIKit
import ProgressHUD
import SafariServices

//MARK: Progress
extension UIViewController {
    func showLoader() {
        ProgressHUD.show()
    }
    
    func dismissLoader() {
        ProgressHUD.dismiss()
    }
}

//MARK: Alert
extension UIViewController {
    func showAlert(title: String = "", message: String = "", okHandler: @escaping(()->())) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            okHandler()
        })
        alertController.addAction(cancel)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: SFSafariController
extension UIViewController {
    func showInSafari(url: String) {
//        let confi = SFSafariViewController.Configuration()
        if let url = URL(string: url) {
            let controller = SFSafariViewController(url: url)
            present(controller, animated: true, completion: nil)
        }
    }
}
