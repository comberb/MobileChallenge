//
//  PlaceholderImageView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 24/05/2023.
//

import SwiftUI

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .cornerRadius(15)
    }
}

struct PlaceholderImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImageView()
    }
}
