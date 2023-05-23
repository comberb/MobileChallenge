//
//  MockURLSession.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 22/05/2023.
//

import Foundation
@testable import MobileChallenge

final class MockURLSession {
    var dataInputs = [URL]()
    var dataOutput: (Data, URLResponse) = (Data(), URLResponse())
}

extension MockURLSession: URLSessionProtocol {
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
        dataInputs.append(url)
        return dataOutput
    }
}
