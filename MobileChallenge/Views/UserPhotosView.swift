//
//  UserPhotosView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 20/05/2023.
//

import SwiftUI

struct UserPhotosView: View {
    // MARK: Properties
    
    @State private var photos: [Photo] = []
    let networkingManager: FlickrManager
    let userID: String
    let username: String
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(photos) { photo in
                        PhotoSummaryView(photo: photo, showUserInfo: false)
                            .padding()
                    }
                }
                .listRowSeparator(.visible)
            }
            .navigationTitle(username)
        }
        .onAppear(perform: search)
    }
    
    // MARK: Methods
    
    func search() {
        Task {
            photos = await networkingManager.search(user: userID)
        }
    }
}
