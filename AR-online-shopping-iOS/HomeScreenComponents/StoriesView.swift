//
//  StoriesView.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import Foundation
import SwiftUI

struct StoriesView: View {
    
    let stories: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 3) {
                ForEach(stories, id: \.self) { name in
                    Image(name)
                        // Add aspect ratio to modify the image size to the frame size
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                        .frame(width: 140, height: 200, alignment: .center)
                        .background(Color.red)
                    
                        // fianly clipped it here
                        .clipped()
//                                         Spacer()
                }
            }
            .padding()
        }
    }
}

