//
//  MockFlickrURLHelper.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 23/05/2023.
//

import Foundation
@testable import MobileChallenge

final class MockFlickrURLHelper {
    var getSearchUserURLInputs = [GetSearchURLInput]()
    var getSearchUserURLOutput: URL?
    
    var getSearchTermURLInputs = [GetSearchURLInput]()
    var getSearchTermURLOutput: URL?
}

extension MockFlickrURLHelper: FlickrURLBuilding {
    func getSearchUserURL(userID: String, page: Int) -> URL? {
        getSearchUserURLInputs.append(.init(string: userID, page: page))
        return getSearchUserURLOutput
    }
    
    func getSearchTermURL(text: String, page: Int) -> URL? {
        getSearchTermURLInputs.append(.init(string: text, page: page))
        return getSearchTermURLOutput
    }
}

extension MockFlickrURLHelper {
    struct GetSearchURLInput: Equatable {
        let string: String
        let page: Int
    }
}
