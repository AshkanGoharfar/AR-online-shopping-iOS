//
//  ContentView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-19.
// Last date modified: 2022-03-27
//  Members:
//  Ashkan Goharfar / id: 301206729
//  Shirin Mansouri / id: 301131068
//  Ali Roudak / id: 301216533

/*
 This application aims to provide agumented reality features for online shopping to improve user expreiences. \n \n This application was developed by a group of students to make online shopping easer compatre with the popular applications. \n \n You can contact the shop by SMS or email. Also, you can follow the shop on the Facebook and Instagram.\n \n We hope you enjoy shopping while using this app!
 */

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeScreen(text: .constant(""))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ShopHomeScreen()
                .tabItem {
                    Label("Products", systemImage: "bag.fill")
                }
            ARViewScreen()
                .tabItem {
                    Label("Reality", systemImage: "cube")
                }
            AboutUsView()
                .tabItem {
                    Label("About", systemImage: "person.3.fill")
                }
        }

    }
}


struct Content_Previews: PreviewProvider  {
    static var previews: some View {
        ContentView()
    }
}

