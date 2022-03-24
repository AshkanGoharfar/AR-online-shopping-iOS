//
//  AshkbookPost.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import Foundation
import SwiftUI

// Ashkbook post view
struct PostView: View  {
    
    @State var isLiked: Bool = false
    
    let model: AshkbookPostModel
    
    var body: some View {
        VStack {
            
            // Profile picture and name
            HStack {
                Image(model.imageName)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50/2)
                
                VStack {
                    HStack {
                        Text(model.name)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    
                    HStack {
                        Text("14 minutes ago")
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }

                }
                Spacer()
            }
            Spacer()
            
            // Actual post
            HStack {
                Text(model.post)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
            
            // Comment like share button
            HStack {
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Text(isLiked ? "Liked" : "Like")
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })
                
            }
            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
}

