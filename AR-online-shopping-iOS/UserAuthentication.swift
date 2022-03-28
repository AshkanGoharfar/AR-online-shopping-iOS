//
//  UserAuthentication.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-28.
//

import SwiftUI
import MessageUI
import FirebaseAuth

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
