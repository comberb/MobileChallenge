//
//  Photo.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import Foundation

struct Photo: Identifiable {
    let id: String
    let owner: String
//    let secret: String
//    let server: String
//    let farm: Int
    let title: String
    let url: URL?
//    let ispublic: Int
//    let isfriend: Int
//    let isfamily: Int
}

extension Photo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id,
             owner,
             title
        case url = "url_m"
    }
}
