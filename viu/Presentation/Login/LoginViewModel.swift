//
//  LoginViewModel.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var result: (isSucces: Bool?, message: String?) = (nil, nil)
    
    var service: LoginService = LoginServiceImpl()
   
    func doLogin(){
        service.login(userName: username, password: password) { [weak self] in
            guard let self = self else { return }
            self.result = (true, nil)
        } onError: { [weak self] message in
            guard let self = self else { return }
            self.result = (false, message)
        }


    }
}
