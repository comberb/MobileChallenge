//
//  FlickrManager.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import Foundation

actor FlickrManager {
    // MARK: Structs
    
    struct FlickrSearchResult: Decodable {
        let photos: PhotoCollection
    }
    
    // MARK: Properties
    
    private let session: URLSessionProtocol
    private let urlHelper: FlickrURLBuilding
//    private let secret = "bd4758fd44f13443" // Not sure If I'll need this yet
    
    // MARK: Lifecycle
    
    init(
        session: URLSessionProtocol = URLSession.shared,
        urlHelper: FlickrURLBuilding = FlickrURLHelper()
    ) {
        self.session = session
        self.urlHelper = urlHelper
    }
    
    // MARK: Methods
    
    private func getPhotos(fromURL url: URL) async -> [Photo] {
        do {
            let (data, _) = try await session.data(from: url, delegate: nil)
            let result: FlickrSearchResult = try decode(data: data)
            return result.photos.photo
        } catch {
            print("Invalid data:", error)
            return []
        }
    }
    
    private func decode<T: Decodable>(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
}

extension FlickrManager: RemoteImageAPI {
    func search(_ searchTerm: String) async -> [Photo] {
        guard let url = urlHelper.getSearchTermURL(text: searchTerm, page: 1) else { return [] }
        return await getPhotos(fromURL: url)
    }
    
    func search(user userID: String) async -> [Photo]  {
        guard let url = urlHelper.getSearchUserURL(userID: userID, page: 1) else { return [] }
        return await getPhotos(fromURL: url)
    }
}
