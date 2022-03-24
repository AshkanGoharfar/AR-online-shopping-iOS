//
//  ShopHomeScreen.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-22.
//

import SwiftUI

struct ShopHomeScreen: View {
    // Initialize an instance of CartManager
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Smart Online Shopping")
                .foregroundColor(Color(UIColor(red: 23/255.0,
                                               green: 120/255.0,
                                               blue: 242/255.0,
                                               alpha: 1))))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
