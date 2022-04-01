//
//  AshkbookPost.swift
//  Ashkbook
//
//  Created by Ashkan Goharfar on 2022-03-03.
//

import Foundation
import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI


// Post view
struct PostView: View  {
    
    @State var isLiked: Bool = false
    
    @State private var imageURL = URL(string: "")

    let model: NewPostModel
    
    var body: some View {
        VStack {
            
            // Profile picture and name
            HStack {
                WebImage(url: URL(string: model.imageName))
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(50/2)

                
                VStack {
                    HStack {
                        Text(model.name)
                            .foregroundColor(Color.blue)
                            .font(.system(size: 18, weight: .semibold, design: .default))
                        Spacer()
                    }
                    
//                    HStack {
//                        Text("14 minutes ago")
//                            .foregroundColor(Color(.secondaryLabel))
//                        Spacer()
//                    }

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
//            HStack {
//                Button(action: {
//                    isLiked.toggle()
//                }, label: {
//                    Text(isLiked ? "Liked" : "Like")
//                })
//
//                Spacer()
//                Button(action: {
//
//                }, label: {
//                    Text("Comment")
//                })
//
//                Spacer()
//                Button(action: {
//
//                }, label: {
//                    Text("Share")
//                })
//
//            }
//            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(7)
    }
    
    func loadImageFromFirebase() {
        
        // Create a reference with an initial file path and name
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        // Create a reference to the file you want to download
        let starsRef = storageRef.child("abcd")
//
//         let storage = Storage.storage().reference(withPath: "abcd")
        starsRef.downloadURL { (url, error) in
             if error != nil {
                 print((error?.localizedDescription)!)
                 return
         }
         print("dasdasd")
         print(url)
         self.imageURL = url!
            
     }
    }
    
//    init() {
//        newPostService.getData()
//    }

}

