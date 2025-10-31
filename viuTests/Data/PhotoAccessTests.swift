//
//  HomeServiceTests.swift
//  viuTests
//
//  Created by Tommy-amarbank on 16/08/22.
//

import XCTest
@testable import viu
import Photos

class PhotoAccessTests: XCTestCase {
    
    func test_getAuthorization_getPhoto_checkShouldLimited(){
        let responseCall = expectation(description: "ResponseCall")
        let mockPhoto: PHPhotoLibraryProtocol.Type = MockPhoto.self
        let sut = PhotoAccess(photoLibrary: mockPhoto)
        sut.getAuthorization()
        var status = PHAuthorizationStatus.denied
        sut.photoLibrary.requestAuthorization(for: .readWrite) { PHAuthorizationStatus in
            status = PHAuthorizationStatus
            responseCall.fulfill()
        }
        print(PHPhotoLibrary.authorizationStatus().rawValue)
        wait(for: [responseCall], timeout: 0.2)
        XCTAssertEqual(status, PHAuthorizationStatus.limited)
    }
}

class MockPhoto: PHPhotoLibraryProtocol {
    static func requestAuthorization(for accessLevel: PHAccessLevel, handler: @escaping (PHAuthorizationStatus) -> Void) {
        handler(.limited)
    }
}
