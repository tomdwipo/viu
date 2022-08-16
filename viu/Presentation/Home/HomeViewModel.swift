//
//  HomeViewModel.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Combine

class HomeViewModel: ObservableObject {
    var network: HomeService = HomeServiceImpl()
    @Published var contents: [HomeElement] = []
    @Published var isError: (Bool, String?) = (false,"")
   
    func showData() {
        network.showData {[weak self] data in
            guard let self = self else { return }
            self.contents = data
        } onError: { message in
            self.isError = (true,message)
        }

    }
}
