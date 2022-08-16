//
//  HomeService.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation

protocol HomeService {
    mutating func showData(onSuccess: @escaping (_ data: [HomeElement]) ->Void, onError: @escaping onErrorResponse)
}

protocol HomeServiceProtocol {
    mutating func call(urlString: String, httpMethod: HttpMethod, body: [String : Any]?, onResponse: @escaping onResponse<HomeResponse>)
}

extension NetworkHelper: HomeServiceProtocol where T == HomeResponse { }

struct HomeServiceImpl: HomeService {
    var network: HomeServiceProtocol = NetworkHelper<HomeResponse>()
    mutating func showData(onSuccess: @escaping ([HomeElement]) -> Void, onError: @escaping onErrorResponse) {
        let url = "https://devel.bebasbayar.com/web/test_programmer.php"
        network.call(urlString: url, httpMethod: .get, body: nil) { response in
            guard let response = response else { return }
            print(response)
            var data: [HomeElement] = []
            for values in response {
                for item in values.value {
                    var itemData = item
                    itemData.date = values.key
                    data.append(itemData)
                }
            }
            onSuccess(data)
        }
    }
}
