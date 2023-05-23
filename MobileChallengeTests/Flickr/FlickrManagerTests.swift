//
//  FlickrManagerTests.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 22/05/2023.
//

import XCTest
@testable import MobileChallenge

final class FlickrManagerTests: XCTestCase {
    var sut: FlickrManager!
    var urlSession: MockURLSession!
    var urlHelper: MockFlickrURLHelper!
    
    override func setUp() {
        super.setUp()
        urlSession = MockURLSession()
        urlHelper = MockFlickrURLHelper()
        sut = FlickrManager(session: urlSession, urlHelper: urlHelper)
    }
    
    override func tearDown() {
        sut = nil
        urlSession = nil
        super.tearDown()
    }
    
    // MARK:  Test Methods - searchTerm
    
    func test_searchTerm_shouldPassInputsToURLHelper() async {
        let term = "mock_search_term"
        
        let results = await sut.search(term)
        
        XCTAssertEqual(urlHelper.getSearchTermURLInputs, [.init(string: term, page: 1)])
    }
    
    func test_searchTerm_whenURLIsReturnedFromURLHelper_shouldPassURLToURLSession() async {
        let expectedURL = URL(string: "www.google.co.uk")
        urlHelper.getSearchTermURLOutput = expectedURL
        let term = "mock_search_term"
        
        let results = await sut.search(term)
        
        XCTAssertEqual(urlSession.dataInputs, [expectedURL])
    }
    
    func test_searchTerm_whenNilIsReturnedFromURLHelper_shouldReturnEmptyResults() async {
        let term = "mock_search_term"
        
        let results = await sut.search(term)
        
        XCTAssertTrue(results.isEmpty)
    }
    
    func test_searchTerm_shouldGetDataFromURLSession() async throws {
        let expectedData = try XCTUnwrap(JSONToData.getData(fromFileNamed: "DummyPhotoData"))
        urlHelper.getSearchTermURLOutput = URL(string: "www.google.co.uk")
        urlSession.dataOutput = (expectedData, URLResponse())
        
        let results = await sut.search("mock_search_term")
        
        XCTAssertEqual(results.count, 9)
    }
    
    // MARK:  Test Methods - searchUser
    
    func test_searchUser_shouldPassInputsToURLHelper() async {
        let userID = "mock_search_id"
        
        let results = await sut.search(user: userID)
        
        XCTAssertEqual(urlHelper.getSearchUserURLInputs, [.init(string: userID, page: 1)])
    }
    
    func test_searchUser_whenURLIsReturnedFromURLHelper_shouldPassURLToURLSession() async {
        urlHelper.getSearchUserURLOutput = URL(string: "www.google.co.uk")
        let id = UUID().uuidString
        let expectedURL = urlHelper.getSearchUserURL(userID: id, page: 1)
        
        let results = await sut.search(user: id)
        
        XCTAssertEqual(urlSession.dataInputs, [expectedURL])
    }
    
    func test_searchUser_whenNilIsReturnedFromURLHelper_shouldReturnEmptyResults() async {
        let id = UUID().uuidString
        
        let results = await sut.search(user: id)
        
        XCTAssertTrue(results.isEmpty)
    }
    
    func test_searchUser_shouldGetDataFromURLSession() async throws {
        let expectedData = try XCTUnwrap(JSONToData.getData(fromFileNamed: "DummyPhotoData"))
        urlHelper.getSearchUserURLOutput = URL(string: "www.google.co.uk")
        urlSession.dataOutput = (expectedData, URLResponse())
        
        let results = await sut.search(user: UUID().uuidString)
        
        XCTAssertEqual(results.count, 9)
    }
}
