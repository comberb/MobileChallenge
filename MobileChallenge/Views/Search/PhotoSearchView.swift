//
//  ContentView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 19/05/2023.
//

import SwiftUI

struct PhotoSearchView: View {
    // MARK: Properties
    
    @ObservedObject var viewModel: PhotoSearchViewModel
    
    // MARK: Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.photos) { photo in
                        NavigationLink {
                            PhotoDetailView(photo: photo)
                        } label: {
                            PhotoSummaryView(photo: photo, showUserInfo: true)
                                .padding()
                        }
                    }
                }
                .listRowSeparator(.visible)
            }
            .navigationTitle("Search")
        }
        .searchable(text: $viewModel.searchTerm)
        .onAppear {
            viewModel.search()
        }
        .onSubmit(of: .search, {
            viewModel.search()
        })
    }
}
