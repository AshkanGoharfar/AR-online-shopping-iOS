//
//  NewPostView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-29.
//

import Foundation

import SwiftUI

import FirebaseStorage
import SDWebImageSwiftUI

import FirebaseAuth


struct NewPostView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @ObservedObject var model = NewPostService()
    
    @State private var imageURL = URL(string: "")

    @State private var text = ""
    
    @Environment(\.editMode) private var editMode
    
    @State private var disableTextField = true

    @State private var wordCount: Int = 0
    
    @FocusState private var nameIsFocused: Bool
    
    @State private var timestamp = 0.0
    
    var body: some View {
        VStack {
            Text("Upload a post about what you purchased").font(.largeTitle)
  
            TextEditor(text: $text)
                .lineSpacing(4)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.orange))
                .padding(.horizontal)
                .disableAutocorrection(true)
                .multilineTextAlignment(.leading)
                .focused($nameIsFocused)
                .padding()

            Button {
                let email = Auth.auth().currentUser?.email
                addNewPost(email: email!)


            } label: {
                Text("Upload Post")
            }
            .frame(width: 300, height: 40)
            .foregroundColor(.black)
            .background(.orange)
            .cornerRadius(15)

            

            Spacer()
        }
        .padding()
    }
    
    func addNewPost(email: String){

        // Create a reference with an initial file path and name
        let storage = Storage.storage()
        let storageRef = storage.reference()

        self.timestamp = NSDate().timeIntervalSince1970
        
        // Create a reference to the file you want to download
        let starsRef = storageRef.child(email)
        Storage.storage().reference().child(email).downloadURL { (url, error) in
             if error != nil {
                 print("ninininninininini")
                 print((error?.localizedDescription)!)
                 return
            }
            print("dasdasd")
            print(url)
            model.addData(name: email, notes: text, imageName: url?.absoluteString ?? "", time: self.timestamp)
            text = ""
            nameIsFocused = false
        }
    }
}
