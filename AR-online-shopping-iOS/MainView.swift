//
//  MainView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-28.
//

import SwiftUI

struct MainView: View {

    @State private var selectedTab = "Home"

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

