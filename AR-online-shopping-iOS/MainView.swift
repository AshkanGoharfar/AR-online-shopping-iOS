//
//  MainView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-28.
//

import SwiftUI

struct MainView: View {

    @State private var selectedTab = "Home"
    @ObservedObject var model = NewPostService()

    var body: some View {
        TabView {
            HomeScreen(model: model)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ShopHomeScreen()
                .tabItem {
                    Label("Products", systemImage: "bag.fill")
                }
            NewPostView()
                .tabItem {
                    Label("Post", systemImage: "plus.square.fill")
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

