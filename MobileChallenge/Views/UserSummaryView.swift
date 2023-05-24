//
//  UserSummaryView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 24/05/2023.
//

import SwiftUI

struct UserSummaryView: View {
    // MARK: Properties
    
    let iconHeight: CGFloat = 48
    
    // MARK: Dependencies
    
    let photo: Photo
    
    // MARK: Body
    
    var body: some View {
        HStack {
            AsyncImage(url: photo.userIcon) { phase in
                if let image = phase.image {
                    NavigationLink {
                        UserPhotosView(networkingManager: FlickrManager(), photo: photo)
                    } label: {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: iconHeight, height: iconHeight)
                            .cornerRadius(iconHeight / 2)
                    }
                } else if phase.error != nil {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: iconHeight, height: iconHeight)
                        .cornerRadius(iconHeight / 2)
                } else {
                    ProgressView()
                        .frame(width: iconHeight, height: iconHeight)
                }
            }
            Text(photo.ownerName ?? photo.ownerID.description)
        }
    }
}
