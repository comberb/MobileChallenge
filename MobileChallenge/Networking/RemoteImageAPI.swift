//
//  RemoteImageAPI.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import Foundation

protocol RemoteImageAPI {
    func search(_ searchTerm: String) async -> [Photo]
    func search(user userID: String) async -> [Photo]
}
