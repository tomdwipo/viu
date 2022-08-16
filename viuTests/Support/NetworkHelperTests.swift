//
//  NetworkHelperTests.swift
//  viuTests
//
//  Created by Tommy-amarbank on 16/08/22.
//

import XCTest
@testable import viu

class NetworkHelperTests: XCTestCase {
    let spyURLSession: SpyURLSession = SpyURLSession()

    func test_networkCall_success_shouldReturn_rc_00(){
        var sut = NetworkHelper<BaseResponse>()
        sut.session = spyURLSession
        let responseCall = expectation(description: "response call")
        var result: BaseResponse?
        sut.call(urlString: "https://www.google.com", httpMethod: .get) { response in
            result = response
            responseCall.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(dummyResponseData(), response(statusCode: 200), nil)
        waitForExpectations(timeout: 0.2)
        XCTAssertEqual(result?.rc, "00")
    }
    
    
    func test_networkCall_error_shouldReturn_nil(){
        var sut = NetworkHelper<DummyModel>()
        sut.session = spyURLSession
        let responseCall = expectation(description: "response call")
        var result: DummyModel?
        sut.call(urlString: "https://www.google.com", httpMethod: .get) { response in
            result = response
            responseCall.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(dummyResponseErrorData(), response(statusCode: 400), nil)
        waitForExpectations(timeout: 0.2)
        XCTAssertNil(result)
    }
}

private struct DummyModel: Codable {
    let data: String
}

private func dummyResponseData() -> Data {
    """
   {
     "rc": "00",
    "rd": "success"
     
   }
""".data(using: String.Encoding.utf8)!
}

private func dummyResponseErrorData() -> Data {
    """
   {
     "rcfd": "00",
    "rdgfgf": "success"
     
   }
""".data(using: String.Encoding.utf8)!
}

private func response(statusCode: Int) -> HTTPURLResponse? {
    HTTPURLResponse(url: URL(string: "https://DUMMY")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
    
}
