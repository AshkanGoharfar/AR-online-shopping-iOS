//
//  HelpScreen.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-04-12.
//

import Foundation
import SwiftUI

struct HelpScreen: View{
    var body: some View {
        Text("Help instruction: \n Home Screen: Shows the new offers and posts. \n Products Screen: Shows the products and options to select them and buy . \n Post Screen: Will offer you to write a post and send it to the Home Screen. \n Reality Screen: This screen will allow you to locate eac ch of the products in your place and see how they are look like there to have a good shopping experience. \n Setting Screen: In this screen you can see help screen, about the applicatio, contact us through SMS or Email, and Sign out options.")
            .offset(x: -2)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(15)
    }
}
