//
//  HomeHostingViewController.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation
import SwiftUI
import Combine

class HomeHostingViewController: UIHostingController<HomeView> {
    var cancellable = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.viewModel.showData()
        rootView.delegate = self
        cancellable = [
            rootView.viewModel.$isError.sink(receiveValue: { [weak self] (isError, message) in
                guard let self = self else { return }
                if isError {
                    self.popupView(message: "Refresh kembali")
                }
            })
        ]
    }
}

extension HomeHostingViewController: HomeDelegate {
    func showDetail(data: HomeElement) {
        self.directToDetail(data: data)
    }
    
    func refreshData() {
        rootView.viewModel.showData()
    }
}
