//
//  FlickrURLHelper.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import Foundation

struct FlickrURLHelper {
    // MARK: Properties
    
    private let key = "48479c733c65a7c8d0ad43a60608ad89"
    
    // MARK: Methods
    
    private func getSearchURLComponents(page: Int) -> URLComponents {
        var components = getBaseURL()
        components.queryItems?.append(.init(name: "method", value: "flickr.photos.search"))
        components.queryItems?.append(.init(name: "extras", value: "url_m, owner_name, icon_server, tags, date_upload"))
        components.queryItems?.append(.init(name: "safe_search", value: "1"))
        components.queryItems?.append(.init(name: "page", value: page.description))
        components.queryItems?.append(.init(name: "per_page", value: "20"))
        
        return components
    }
    
    private func getBaseURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.flickr.com"
        components.path = "/services/rest"
        components.queryItems = [URLQueryItem]()
        
        components.queryItems?.append(.init(name: "api_key", value: key))
        components.queryItems?.append(.init(name: "format", value: "json"))
        components.queryItems?.append(.init(name: "nojsoncallback", value: "1"))
        
        return components
    }
}

extension FlickrURLHelper: FlickrURLBuilding {
    func getSearchUserURL(userID: String, page: Int) -> URL? {
        var components = getSearchURLComponents(page: page)
        components.queryItems?.append(.init(name: "user_id", value: userID))
        
        return components.url
    }
    
    func getSearchTermURL(text: String, page: Int) -> URL? {
        var components = getSearchURLComponents(page: page)
        components.queryItems?.append(.init(name: "text", value: text))
        
        return components.url
    }
}
