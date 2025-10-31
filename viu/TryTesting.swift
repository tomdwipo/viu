//
//  TryTesting.swift
//  viu
//
//  Created by Tommy-amarbank on 16/08/22.
//

import Foundation
import Photos


protocol PHPhotoLibraryProtocol {
    static func requestAuthorization(for accessLevel: PHAccessLevel, handler: @escaping (PHAuthorizationStatus) -> Void)
}
extension PHPhotoLibrary: PHPhotoLibraryProtocol {
    static func requestAuthorization(for accessLevel: PHAccessLevel, handler: @escaping (PHAuthorizationStatus) -> Void) {
        #if DEBUG
        handler(.limited)
        #endif
    }
}
class PhotoAccess {
    var photoLibrary: PHPhotoLibraryProtocol.Type
    var status :PHAuthorizationStatus?
    init(photoLibrary: PHPhotoLibraryProtocol.Type) {
        self.photoLibrary = PHPhotoLibrary.self
    }
    func getAuthorization(){
        photoLibrary.requestAuthorization(for: .readWrite) { PHAuthorizationStatus in
            self.status = PHAuthorizationStatus
        }
    }
}


