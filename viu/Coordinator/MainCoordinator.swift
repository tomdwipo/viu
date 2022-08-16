//
//  Coordinator.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation
import UIKit
import SwiftUI

struct MainCoordinator {
    static func main() -> UIViewController {
        let viewModel = LoginViewModel()
        let view = LoginView(viewModel: viewModel)
        let hc = LoginHostingViewController(rootView: view)
        return hc
    }
}

protocol Coordinator {
    func directToHome()
    func directToDetail(data: HomeElement)
}

extension UIViewController: Coordinator {
    func directToHome() {
        let viewModel = HomeViewModel()
        let view = HomeView(viewModel: viewModel)
        let hc = HomeHostingViewController(rootView: view)
        hc.modalPresentationStyle = .overFullScreen
        self.present(hc, animated: true)
    }
    
    func directToDetail(data: HomeElement){
        let viewModel = DetailViewModel()
        viewModel.data = data
        let view = DetailView(viewModel: viewModel)
        let hc = UIHostingController(rootView: view)
        self.present(hc, animated: true)
    }

}
