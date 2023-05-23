//
//  JSONToData.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import Foundation

class JSONToData {
    static func getData(fromFileNamed name: String) -> Data? {
        guard let path = Bundle(for: self).path(forResource: name, ofType: "json") else { return nil }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path), options: [])
        } catch {
            return nil
        }
    }
}
