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
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                        .frame(height: imageHeight)
                }
            }
            Text(photo.title)
        }
    }
}
