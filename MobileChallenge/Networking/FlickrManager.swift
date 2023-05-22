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
    
    private let urlHelper = FlickrURLHelper()
//    private let secret = "bd4758fd44f13443" // Not sure If I'll need this yet
    
    // MARK: Methods
    
    func search(_ searchTerm: String) async -> [Photo] {
        guard let url = urlHelper.getSearchTermURL(text: searchTerm, page: 1) else { return [] }
        return await getPhotos(fromURL: url)
    }
    
    func search(user userID: String) async -> [Photo]  {
        guard let url = urlHelper.getSearchUserURL(userID: userID, page: 1) else { return [] }
        return await getPhotos(fromURL: url)
    }
    
    private func getPhotos(fromURL url: URL) async -> [Photo] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do {
                let decodedResponse = try JSONDecoder().decode(FlickrSearchResult.self, from: data)
                return decodedResponse.photos.photo
            } catch {
                print("Something went wrong:", error)
                return []
            }
        } catch {
            print("Invalid data:", error)
            return []
        }
    }
}
