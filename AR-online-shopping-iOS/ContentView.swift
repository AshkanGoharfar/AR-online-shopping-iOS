//
//  ContentView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-19.
//


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

