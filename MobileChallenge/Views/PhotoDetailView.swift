//
//  PhotoDetailView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import SwiftUI

struct PhotoDetailView: View {
    // MARK: Properties
    
    let photo: Photo
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: photo.url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(15)
                        .padding()
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(15)
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                }
            }
            Text(photo.title)
                .font(.headline)
                .padding(.horizontal)
            if let taken = photo.taken {
                Text(taken)
            }
            if let license = photo.license {
                Text(license)
                    .padding(.horizontal)
            }
            if let tags = photo.tags {
                Text(tags)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

