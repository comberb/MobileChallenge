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
//    let secret: String
//    let server: String
//    let farm: Int
    let title: String
    let url: URL?
    let ownerName: String?
    let iconServer: String?
    let iconFarm: Int?
    let taken: String?
    let license: String?
    let tags: String?
//    let ispublic: Int
//    let isfriend: Int
//    let isfamily: Int
    
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
             license,
             tags
        case ownerID = "owner"
        case url = "url_m"
        case ownerName = "ownername"
        case iconServer = "iconserver"
        case iconFarm = "iconfarm"
        case taken = "date_taken"
    }
}

extension Photo: Equatable {}
