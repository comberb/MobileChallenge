//
//  PhotoSummaryView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import SwiftUI

struct PhotoSummaryView: View {
    // MARK: Properties
    
    let photo: Photo
    let imageHeight: CGFloat = 200
    let iconHeight: CGFloat = 48
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: photo.url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: imageHeight)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: imageHeight)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: imageHeight)
                }
            }
            HStack {
                AsyncImage(url: photo.userIcon) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: iconHeight, height: iconHeight)
                            .cornerRadius(iconHeight / 2)
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
}
