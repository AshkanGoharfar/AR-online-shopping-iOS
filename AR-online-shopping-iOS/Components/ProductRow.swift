//
//  ProductRow.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {

            WebImage(url: URL(string: product.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("$\(product.price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(id: "2", name: "redchair", image: "redchair_2x", price: 12))
            .environmentObject(CartManager())
    }
}
