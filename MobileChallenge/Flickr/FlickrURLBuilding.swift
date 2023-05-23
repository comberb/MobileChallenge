//
//  FlickrURLBuilding.swift
//  MobileChallenge
//
//  Created by Ben Comber on 23/05/2023.
//

import Foundation

protocol FlickrURLBuilding {
    func getSearchUserURL(userID: String, page: Int) -> URL?
    func getSearchTermURL(text: String, page: Int) -> URL?
}
