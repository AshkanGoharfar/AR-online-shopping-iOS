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
    
    @ObservedObject var model = ProductService()

    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(model.list) { product in
                        NavigationLink(destination: ProductView(product: product)){
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    
                    
                    
                    
//                        ForEach(posts, id: \.self) { model in
//                            PostView(model: model)
//                            Spacer()
//                        }
                    
                    
//                    ForEach (model.list.sorted {$0.time < $1.time}.reversed()) { item in
//                        
//                        HStack {
//                            PostView(model: item)
//                            Spacer()
//
//                        }
//                    }
                    
                    
                    
                    
                }
                .onAppear(perform: model.getData)
                .padding()
            }
            .navigationTitle(Text("Products")
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
    
//    init(model: ProductService) {
//        self.model = model
//        self.model.getData()
//    }
}
