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
    let imageHeight: CGFloat = 300
    
    let showUserInfo: Bool
    let tagTap: ((String) -> Void)?
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: photo.url) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .frame(height: imageHeight)
                        .padding(.top)
                        .clipped()
                } else if phase.error != nil {
                    PlaceholderImageView()
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: imageHeight)
                }
            }
            if showUserInfo {
                UserSummaryView(photo: photo)
                    .padding(.horizontal, 8)
            }
            if let tags = photo.tags, !tags.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        Spacer()
                        ForEach(tags.components(separatedBy: " ").prefix(5), id: \.self) { tag in
                            TagView(tag: tag)
                                .onTapGesture {
                                    if let tagTap {
                                        tagTap(tag)
                                    }
                                }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
