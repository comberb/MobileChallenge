//
//  TagView.swift
//  MobileChallenge
//
//  Created by Ben Comber on 24/05/2023.
//

import SwiftUI

struct TagView: View {
    // MARK: Dependencies
    
    let tag: String
    
    // MARK: Body
    
    var body: some View {
        Text(tag)
            .frame(height: 30)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.teal)
                        .shadow(radius: 2)
                }
            }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: "Tag")
    }
}
