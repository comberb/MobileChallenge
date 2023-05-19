//
//  ContentView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import SwiftUI

struct PhotoSearchView: View {
    // MARK: Properties
    
    @State private var photos: [Photo] = []
    @State private var searchTerm = ""
    let networkingManager: FlickrManager
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(photos) { photo in
                        PhotoSummaryView(photo: photo)
                            .padding()
                    }
                }
                .listRowSeparator(.visible)
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchTerm)
        .onAppear(perform: search)
        .onSubmit(of: .search, search)
    }
    
    // MARK: Methods
    
    func search() {
        Task {
            photos = await networkingManager.search(searchTerm)
        }
    }
}
