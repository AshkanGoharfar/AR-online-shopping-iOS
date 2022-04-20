//
//  UserAuthentication.swift
//  AR-online-shopping-iOS
//
//  Created by Shirin Mansouri on 2022-03-28.
//

import SwiftUI
import MessageUI
import FirebaseAuth
import FirebaseStorage

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        // use [weak self] to prevent memory leak
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            
            self.signedIn = true
//            // to prevent memory leak
//            DispatchQueue.main.sync {
//                //Success
//                self?.signedIn = true
//            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            self.signedIn = true

//            DispatchQueue.main.sync {
//                //Success
//                self?.signedIn = true
//            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    func uploadImage(image: UIImage, imageName: String) {
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            storage.reference().child(imageName).putData(imageData, metadata: nil){
                (_, err) in
                if let err = err {
                    print("an error has occured - \(err.localizedDescription)")
                } else {
                    print("image uploaded successfully")
                }
            }
        } else {
            print("couldn't unwrap/case image to data")
        }
    }

    
}

struct UserAuthentication: View {

    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            if viewModel.signedIn {
//                Text("Your are signed in")
//                Button(action: {
//                    viewModel.signOut()
//                }, label: {
//                    Text("Sign Out")
//                        .foregroundColor(Color.blue)
//                })
                
                MainView()
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarHidden(true)
                
                
            }
                
            else {
                SignInView()
            }
        }
            .onAppear{
                viewModel.signedIn = viewModel.isSignedIn
            }

    }
}





struct SignInView: View {

    @State var email = ""
    
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                        // At first we want to be sure that email and password fields are not empty
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signIn(email: email, password: password)
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Sign In")
        }
}






struct SignUpView: View {

    @State var email = ""
    
    @State var password = ""
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack {
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                    Spacer()
                    
                    HStack {
                        Image(uiImage: self.image)
//                        Image(systemName: "person.badge.plus")
                                  .resizable()
                                  .cornerRadius(50)
                                  .frame(width: 100, height: 100)
                                  .background(Color.black.opacity(0.2))
                                  .aspectRatio(contentMode: .fill)
                                  .clipShape(Circle())

                         Text("Choose Profile Photo")
                             .font(.headline)
                             .frame(maxWidth: .infinity)
                             .frame(width: 200, height: 50)
                             .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                             .cornerRadius(16)
                             .foregroundColor(.white)
                                 .padding(.horizontal, 20)
                                 .onTapGesture {
                                   showSheet = true
                                 }
                            }
                        .padding(.horizontal, 20)
                        .sheet(isPresented: $showSheet) {
                                    // Pick an image from the photo library:
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                                    //  If you wish to take a photo from camera instead:
//                                 ImagePicker(sourceType: .camera, selectedImage: self.$image)
                            }

                    
                    Spacer()

                    
                    
                    
                    Button(action: {
                        
                        // At first we want to be sure that email and password fields are not empty
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }

                        self.viewModel.uploadImage(image: self.image, imageName: self.email)
//                        uploadImage(image: UIImage, imageName: String)

                        viewModel.signUp(email: email, password: password)

                        
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create Account")
        }
}
