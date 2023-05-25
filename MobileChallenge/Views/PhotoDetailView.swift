//
//  PhotoDetailView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 22/05/2023.
//

import SwiftUI

struct PhotoDetailView: View {
    // MARK: Properties
    
    private let dateFormatter = DateFormatter()
    
    // MARK: Dependencies
    
    let photo: Photo
    
    // MARK: Body
    
    var body: some View {
        ScrollView {
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
                        PlaceholderImageView()
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                }
                UserSummaryView(photo: photo)
                    .padding(8)
                Text(photo.title)
                    .font(.headline)
                    .padding(.horizontal)
                if let dateString = photo.date, let date = formattedDate(dateString) {
                    Text(date)
                        .foregroundColor(.secondary)
                        .italic()
                        .padding()
                }
                Divider()
                    .padding(.vertical, 8)
                if let tags = photo.tags, !tags.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Tags")
                            .font(.title3)
                            .fontWeight(.bold)
                        ForEach(tags.components(separatedBy: " "), id: \.self) { tag in
                            TagView(tag: tag)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func formattedDate(_ string: String) -> String? {
        guard let double = Double(string), double > 0 else { return nil }
        let date = Date(timeIntervalSince1970: double)
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}

