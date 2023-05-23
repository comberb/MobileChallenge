//
//  URLSessionProtocol.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL, delegate: (URLSessionTaskDelegate)?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
