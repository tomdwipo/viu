//
//  LoginServiceTests.swift
//  viuTests
//
//  Created by Tommy-amarbank on 16/08/22.
//

import XCTest
@testable import viu

class LoginServiceTests: XCTestCase {

    func test_login_success(){
        let network: NetworkLoginProtocol = MockLoginService(isSuccess: true)
        var sut: LoginService = LoginServiceImpl(network: network)
        let responseCall = expectation(description: "response call")
        var response = ""

        sut.login(userName: "", password: "") {
            response = "ok"
            responseCall.fulfill()
        } onError: { message in
            
        }
        
        waitForExpectations(timeout: 0.3)
        XCTAssertEqual(response, "ok")

    }
    
    
    func test_login_error(){
        let network: NetworkLoginProtocol = MockLoginService(isSuccess: false)
        var sut: LoginService = LoginServiceImpl(network: network)
        let responseCall = expectation(description: "response call")
        var response: String? = ""
        sut.login(userName: "", password: "") {
           
        } onError: { message in
            response = message
            responseCall.fulfill()
        }
        
        waitForExpectations(timeout: 0.3)
        XCTAssertEqual(response, "error")

    }
}

private class MockLoginService: NetworkLoginProtocol {
    var isSuccess: Bool
    init(isSuccess: Bool){
        self.isSuccess = isSuccess
    }
    func call(urlString: String, httpMethod: HttpMethod, body: [String: Any]?, onResponse: @escaping onResponse<BaseResponse>) {
        if isSuccess {
            onResponse(BaseResponse(rc: "00", rd: "ok"))
        }else{
            onResponse(BaseResponse(rc: "01", rd: "error"))
        }
    }
    
    
}

