//
//  MailView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-23.
//
import SwiftUI
import MessageUI
import FirebaseAuth

/// Main View
struct AboutUsView: View {

    /// The delegate required by `MFMailComposeViewController`
    private let mailComposeDelegate = MailDelegate()

    /// The delegate required by `MFMessageComposeViewController`
    private let messageComposeDelegate = MessageDelegate()

    
    @EnvironmentObject var viewModel: AppViewModel
    
    let auth = Auth.auth()
    
    func signOut() {
        try? auth.signOut()
        
        viewModel.signedIn = false
    }

    var body: some View {
        ScrollView{


            ZStack{
        VStack {
        
            Spacer()
            HStack{
            Text("About Us")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 300)
            }
                .padding()

            HStack{
            Text("This application aims to provide agumented reality features for online shopping to improve user expreiences. \n \n This application is developed by a group of students to make online shopping easer compatre with the popular applications. \n \n You can contact the shop by SMS or email. Also, you can follow the shop on the Facebook and Instagram.\n \n We hope you enjoy shopping while using this app!")
                    .padding()
            }
            
            HStack{
            Text("Help")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 300)
            }
                .padding()
            
            
            VStack{
                HStack{
                    Text("Home Screen")
                            .fontWeight(.bold)
                            .padding()
                    Spacer()
                }

                HStack{
                    Text("Shows the new offers and posts.")
                            .padding()
                    Spacer()
                }
                
                HStack{
                    Text("Products Screen")
                            .fontWeight(.bold)
                            .padding()
                    Spacer()
                }

                HStack{
            Text("Shows the products and options to select them and buy.")
                    .padding()
                    Spacer()
                }
                
                HStack{
                    Text("Post Screen")
                            .fontWeight(.bold)
                            .padding()
                    Spacer()
                }

                
                HStack{
            Text("Will offer you to write a post and send it to the Home Screen.")
                    .padding()
                    Spacer()
                }

                
                HStack{
                    Text("Reality Screen")
                            .fontWeight(.bold)
                            .padding()
                    Spacer()
                }

                HStack{
            Text("This screen will allow you to locate each of the products in your place and see how they are look like there to have a good shopping experience.")
                    .padding()
                    Spacer()
                }
                
                HStack{
                    Text("Setting Screen")
                            .fontWeight(.bold)
                            .padding()
                    Spacer()
                }

                HStack{
            Text("In this screen you can see help screen, about the applicatio, contact us through SMS or Email, and Sign out options.")
                    .padding()
                    Spacer()
                }

            }

            
            HStack{
                Text("Contact Us")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 300)
                        .padding()
            }
            HStack {
                Spacer()
                Image(systemName: "envelope")

                    .resizable()
                    .frame(width: 45, height: 35)
                    .foregroundColor(Color(.orange))
                    .onTapGesture{
                        self.presentMailCompose()
                    }
                
                Spacer()


                Image(systemName: "message")

                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(Color(.orange))
                    .onTapGesture{
                        self.presentMessageCompose()
                    }
                Spacer()
            }
            .padding()
            
            Spacer()
            
            HStack{
                Text("Follow Us")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 300)
                        .padding()
            }
            
            HStack{
                Spacer()
                Button(action: {
                    guard let url = URL(string: "https://www.instagram.com/Maradona/?hl=en") else {
                      return //be safe
                    }

                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }) {
                    Image("InstagramIcon")

                        .resizable()
                        .frame(width: 45, height: 45)
                }
                Spacer()
                Button(action: {
                    guard let url = URL(string: "https://www.facebook.com/diegomaradona") else {
                      return //be safe
                    }

                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }) {
                    Image("FacebookIcon")

                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color(.orange))
                }
                Spacer()
            }
            .padding()

        }
    }
            Spacer()
            VStack {
                
                HStack{
                    Text("Sign Out")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(width: 300)
                            .padding()
                }
                
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    Text("Sign Out")
                        .frame(width: 300, height: 40)
                        .foregroundColor(.black)
                        .background(.orange)
                        .cornerRadius(15)
                })
            }
            Spacer()
    }
        
    }
}

// MARK: The mail part
extension AboutUsView {

    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {

            controller.dismiss(animated: true)
        }

    }

    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate


        vc?.present(composeVC, animated: true)
    }
}

// MARK: The message part
extension AboutUsView {

    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }

    }

    /// Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = messageComposeDelegate


        vc?.present(composeVC, animated: true)
    }
}
