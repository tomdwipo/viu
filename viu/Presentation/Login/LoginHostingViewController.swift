//
//  LoginHostingViewController.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import SwiftUI
import Combine

class LoginHostingViewController: UIHostingController<LoginView> {
    var cancelable = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelable = [
            rootView.viewModel.$result.sink(receiveValue: { [weak self] (isSucces, message) in
                guard let self = self else { return }
                guard let isSuccess = isSucces else { return }
                if isSuccess {
                    self.directToHome()
                }else{
                    self.popupView(message: message ?? "")
                }
            })
        ]
    }
}

