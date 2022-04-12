//
//  ProductCard.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCard: View {
    // environemt object modifier of CartManager
    @EnvironmentObject var cartManager: CartManager
//    var product: Product
    
    
    
    
    @State private var imageURL = URL(string: "")
    
    
    var product: Product
    
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaleEffect()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(id: "1", name: "cupandsaucer", image: "cupandsaucer_2x", price: 10))
            .environmentObject(CartManager())
    }
}
