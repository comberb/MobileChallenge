//
//  PhotoSearchViewModelTests.swift
//  MobileChallengeTests
//
//  Created by Ben Comber on 23/05/2023.
//

import XCTest
@testable import MobileChallenge

final class PhotoSearchViewModelTests: XCTestCase {
    var sut: PhotoSearchViewModel!
    var networkingManager: MockRemoteImageAPI!
    
    override func setUp() {
        super.setUp()
        networkingManager = MockRemoteImageAPI()
        sut = PhotoSearchViewModel(networkingManager: networkingManager)
    }
    
    override func tearDown() {
        sut = nil
        networkingManager = nil
        super.tearDown()
    }
    
    // MARK:  Test Methods - search
    
    @MainActor
    func test_search_shouldCallNetworkingManagerSearch() async {
        let expectedSearchTerm = "mock_search_term"
        sut.searchTerm = expectedSearchTerm
        
        let task = sut.search()
        _ = await task.result
        
        XCTAssertEqual(networkingManager.searchTermInputs, [expectedSearchTerm])
    }
    
    @MainActor
    func test_search_shouldGetPhotosFromNetworkingManager() async {
        let expectedPhotos: [Photo] = [.mock]
        networkingManager.searchTermOutputs = expectedPhotos
        
        let task = sut.search()
        _ = await task.result
        
        XCTAssertEqual(sut.photos, expectedPhotos)
    }
}
