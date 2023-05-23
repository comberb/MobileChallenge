//
//  MockRemoteImageAPI.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 23/05/2023.
//

import Foundation
@testable import MobileChallenge

final class MockRemoteImageAPI {
    var searchTermInputs = [String]()
    var searchTermOutputs = [Photo]()
    
    var searchUserInputs = [String]()
    var searchUserOutputs = [Photo]()
}

extension MockRemoteImageAPI: RemoteImageAPI {
    func search(_ searchTerm: String) async -> [Photo] {
        searchTermInputs.append(searchTerm)
        return searchTermOutputs
    }
    
    func search(user userID: String) async -> [Photo] {
        searchUserInputs.append(userID)
        return searchUserOutputs
    }
}
