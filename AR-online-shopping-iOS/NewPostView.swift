//
//  NewPostView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-29.
//

import Foundation

import SwiftUI

struct NewPostView: View {
    
    @State private var postImage: Image?
    @State private var pickedImage: Image?
    @State private var showingActionSheet = false
    @State private var showingImagePicker = false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no "
    @State private var text = ""
    
    func loadImage() {
        guard let inputImage = pickedImage else {return}
        
        postImage = inputImage
    }
    
    func clear() {
        self.text = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "person.circle.fill")
    }
    
    func errorCheck() -> String? {
        if text.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty {
            return "Please add a caption and provide an image "
        }
        return nil
    }
    
    var body: some View {
        VStack {
            Text("Upload a post about what you purchased").font(.largeTitle)
            
//            VStack {
//                if postImage != nil {
//                    postImage!.resizable()
//                        .frame(width: 300, height: 200)
//                        .onTapGesture {
//                            self.showingActionSheet = true
//                        }
//                }
//            }
            
            TextEditor(text: $text)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
                .padding(.horizontal)
            
            Button {
                print("Comming Soon")
            } label: {
                Text("Upload Post")
            }
            .frame(width: 300, height: 40)
            .foregroundColor(.black)
            .background(.orange)
            .cornerRadius(15)
        }
        .padding()
        
//        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//            ImagePi
//        }
    }
}
