//
//  Dialog.swift
//  codeManagement
//
//  Created by Macbook on 2/25/22.
//

import Foundation
import UIKit

class Dialog {
    static func showAlert(viewController : UIViewController, title : String, message : String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alertVC, animated: true, completion: nil)
    }
}
