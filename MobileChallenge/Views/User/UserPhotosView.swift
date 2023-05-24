//
//  UserPhotosView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 23/05/2023.
//

import SwiftUI

struct UserPhotosView: View {
    // MARK: Properties
    
    @State private var photos: [Photo] = []
    let networkingManager: FlickrManager
    let photo: Photo
    let iconHeight: CGFloat = 80
    
    // MARK: Body
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                UserSummaryView(photo: photo)
                
                ForEach(photos) { photo in
                    NavigationLink {
                        PhotoDetailView(photo: photo)
                    } label: {
                        PhotoSummaryView(photo: photo, showUserInfo: false, tagTap: nil)
                    }
                }
            }
        }
        .navigationTitle("Profile")
        .onAppear(perform: search)
    }
    
    // MARK: Methods
    
    func search() {
        Task {
            photos = await networkingManager.search(user: photo.ownerID)
        }
    }
}
