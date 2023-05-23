//
//  PhotoSearchViewModel.swift
//  MobileChallenge
//
//  Created by Ben Comber on 23/05/2023.
//

import Foundation

final class PhotoSearchViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var photos: [Photo] = []
    @Published var searchTerm = ""
    
    // MARK: Dependencies
    
    private let networkingManager: RemoteImageAPI
    
    // MARK: Lifecycle
    
    init(networkingManager: RemoteImageAPI = FlickrManager()) {
        self.networkingManager = networkingManager
    }
    
    // MARK: Methods
    
    @MainActor
    @discardableResult
    func search() -> Task<Void, Never> {
        Task {
            photos = await networkingManager.search(searchTerm)
        }
    }
}
