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
    
    private let key = "48479c733c65a7c8d0ad43a60608ad89"
//    private let secret = "bd4758fd44f13443" // Not sure If I'll need this yet
    
    // MARK: Methods
    
    func search(_ searchTerm: String) async -> [Photo] {
        guard let url = getURL(text: searchTerm, page: 1) else { return [] }
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
    
    private func getURL(text: String, page: Int) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.flickr.com"
        components.path = "/services/rest"
        components.queryItems = [URLQueryItem]()
        
        components.queryItems?.append(.init(name: "api_key", value: key))
        components.queryItems?.append(.init(name: "method", value: "flickr.photos.search"))
        components.queryItems?.append(.init(name: "format", value: "json"))
        components.queryItems?.append(.init(name: "nojsoncallback", value: "1"))
        components.queryItems?.append(.init(name: "text", value: text))
        components.queryItems?.append(.init(name: "page", value: page.description))
        
        components.queryItems?.append(.init(name: "extras", value: "url_m"))
        
        components.queryItems?.append(.init(name: "safe_search", value: "1"))
        
        return components.url
    }
}
