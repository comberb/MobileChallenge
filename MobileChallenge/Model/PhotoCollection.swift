//
//  PhotoCollection.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import Foundation

struct PhotoCollection: Decodable {
    let page: Int
    var photo: [Photo]
}
