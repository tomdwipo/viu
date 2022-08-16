//
//  UIHostingViewController+Extension.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import SwiftUI

extension UIHostingController {
    func popupView(message: String){
        let popup = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        popup.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(popup, animated: true)
    }
}
