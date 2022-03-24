//
//  CartView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }
//                VStack{
//                NavigationView {
//                        NavigationLink(destination: ARViewScreen()){
//                            Text("See Products in Your Home")
//                                .foregroundColor(Color(.white))
//                                .padding(12)
//                        }
//                        .background(Color.orange)
//                        .cornerRadius(12)
//                        .navigationBarTitle(Text("Products"))
//                }
//                }
                HStack {
                    Text("Your Card Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                Spacer()
                Spacer()
                Button {
                    print("Comming Soon")
                } label: {
                    Text("Apple Pay Comming Soon")
                }
                .frame(width: 300, height: 40)
                .foregroundColor(.black)
                .background(.orange)
                .cornerRadius(15)
            } else {
                Text("Your cart is empty")
            }

        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
