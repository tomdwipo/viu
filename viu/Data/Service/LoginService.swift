//
//  LoginService.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation


protocol LoginService {
    mutating func login(userName: String, password: String, onSuccess:@escaping ()-> Void, onError: @escaping onErrorResponse)
}

struct LoginServiceImpl: LoginService {

    var network: NetworkLoginProtocol = NetworkHelper<BaseResponse>()

    mutating func login(userName: String, password: String,onSuccess: @escaping () -> Void, onError: @escaping onErrorResponse) {
        let body = ["user": userName, "password" : password]
        let url = "https://devel.bebasbayar.com/web/test_programmer.php"
        network.call(urlString: url, httpMethod: .post, body: body) { response in
            if response?.rc == "00" {
                onSuccess()
            }else{
                onError(response?.rd)
            }
        }
    }
}

extension NetworkHelper: NetworkLoginProtocol where T == BaseResponse { }

protocol NetworkLoginProtocol {
    mutating func call(urlString: String, httpMethod: HttpMethod, body: [String: Any]?, onResponse: @escaping onResponse<BaseResponse>)
}
