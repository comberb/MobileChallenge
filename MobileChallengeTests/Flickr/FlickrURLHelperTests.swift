//
//  FlickrURLHelperTests.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 23/05/2023.
//

import XCTest
@testable import MobileChallenge

final class FlickrURLHelperTests: XCTestCase {
    var sut: FlickrURLHelper!
    
    override func setUp() {
        super.setUp()
        sut = FlickrURLHelper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK:  Test Methods
    
    func test_getSearchTermURL_shouldReturnCorrectSearchTerm() async {
        let text = "mock_search_term"
        let page = 6
        
        let url = sut.getSearchTermURL(text: text, page: page)
        
        XCTAssertEqual(url, URL(string: "https://api.flickr.com/services/rest?api_key=48479c733c65a7c8d0ad43a60608ad89&format=json&nojsoncallback=1&method=flickr.photos.search&extras=url_m,%20owner_name,%20icon_server,%20date_taken,%20license,%20tags&safe_search=1&page=6&per_page=20&text=mock_search_term"))
    }
    
    func test_searchSearchTerm_shouldGetDataFromURLSession() async throws {
        let userID = "123456789"
        let page = 6
        
        let url = sut.getSearchUserURL(userID: userID, page: page)
        
        XCTAssertEqual(url, URL(string: "https://api.flickr.com/services/rest?api_key=48479c733c65a7c8d0ad43a60608ad89&format=json&nojsoncallback=1&method=flickr.photos.search&extras=url_m,%20owner_name,%20icon_server,%20date_taken,%20license,%20tags&safe_search=1&page=6&per_page=20&user_id=123456789"))
    }
}
