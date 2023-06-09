//
//  Photo.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import Foundation

struct Photo: Identifiable {
    let id: String
    let ownerID: String
    let title: String
    let url: URL?
    let ownerName: String?
    let iconServer: String?
    let iconFarm: Int?
    let date: String?
    let tags: String?
    
    var userIcon: URL? {
        guard iconFarm != 0 else {
            return URL(string: "https://www.flickr.com/images/buddyicon.gif")
        }
        
        return URL(string: "http://farm\(iconFarm?.description ?? "").staticflickr.com/\(iconServer ?? "")/buddyicons/\(ownerID).jpg")
    }
}

extension Photo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id,
             title,
             tags
        case ownerID = "owner"
        case url = "url_m"
        case ownerName = "ownername"
        case iconServer = "iconserver"
        case iconFarm = "iconfarm"
        case date = "dateupload"
    }
}

extension Photo: Equatable {}
