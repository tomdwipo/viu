//
//  NetworkHelper.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation

typealias onErrorResponse = (_ message: String?) ->Void

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

struct NetworkHelper<T: Codable> {
    private var dataTask: URLSessionDataTask?
    var session: URLSessionProtocol = URLSession.shared

    mutating func call(urlString:String,httpMethod: HttpMethod, body: [String: Any]? = nil, onResponse: @escaping onResponse<T>){
        let url = URL(string: urlString)
        guard let url = url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        if let body = body {
            let httpBody = try? JSONSerialization.data(withJSONObject: body)
            urlRequest.httpBody = httpBody
        }
        dataTask =  session.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                var decoded: T?
                do {
                    decoded = try JSONDecoder().decode(T.self, from: data)
                }catch{
                    decoded = nil
                }
                DispatchQueue.main.async {
                    onResponse(decoded)
                }
            }
        }
        dataTask?.resume()
    }
}




protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

typealias onResponse<T:Decodable> = (_ response: T?) -> Void
