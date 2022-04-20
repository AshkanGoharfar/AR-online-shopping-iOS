//
//  ProductView.swift
//  AR-online-shopping-iOS
//
//  Created by Ali Roudak on 2022-04-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductView: View {

    @EnvironmentObject var cartManager: CartManager
    
    @State private var imageURL = URL(string: "")
    
    @State private var isAnimating: Bool = false
    
    var product: Product
    
    var body: some View {
//        Text("")

//        VStack(alignment: .leading, spacing: 5, content: {
//            Text(product.name)
//                .font(.largeTitle)
//                .fontWeight(.black)
//
//            Spacer()
//        }) //: VStack
        

        VStack(alignment: .leading, spacing: 0, content: {
            Text(product.name)
                .font(.largeTitle)
                .fontWeight(.black)



        })
        .offset(y: isAnimating ? -50: -75)
        
        Spacer()

        ScrollView(.vertical, showsIndicators: false, content: {

        HStack(alignment: .center, spacing: 0, content: {
            
            Spacer()
            Text("Price")
                .font(.title)
                .fontWeight(.black)
                .scaleEffect(0.8, anchor: .leading)
            
            Text("\(product.price)$")
                .fontWeight(.semibold)
            
            WebImage(url: URL(string: product.image))
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .offset(y: isAnimating ? 0 : -35)
//                .frame(width: 180)
//                .scaleEffect()
        })
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)){
                isAnimating.toggle()
            }
        })
//        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(red: 255/255, green: 255/255, blue: 255/255)
        )
        .padding()
        
        Spacer()
        Spacer()

            Text("Product Description")
                .font(.title)
                .fontWeight(.black)
                .scaleEffect(0.8, anchor: .leading)

            

            Text(product.description)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding()
        })
//        VStack(alignment: .leading, spacing: 6, content: {
//            Text(product.description)
//                .padding()
//
//        })
//        .offset(y: isAnimating ? -50: -75)
        
        Spacer()
        
        
//        ZStack(alignment: .topTrailing) {
//            ZStack(alignment: .bottom) {
//                WebImage(url: URL(string: product.image))
//                    .resizable()
//                    .cornerRadius(20)
//                    .frame(width: 180)
//                    .scaleEffect()
//
//                VStack(alignment: .leading) {
//                    Text(product.name)
//                        .bold()
//
//                    Text("\(product.price)$")
//                        .font(.caption)
//                }
//                .padding()
//                .frame(width: 180, alignment: .leading)
//                .background(.ultraThinMaterial)
//                .cornerRadius(20)
//            }
//            .frame(width: 180, height: 250)
//            .shadow(radius: 3)
//
//            Button {
//                cartManager.addToCart(product: product)
//            } label: {
//                Image(systemName: "plus")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(.black)
//                    .cornerRadius(50)
//                    .padding()
//            }
//        }

    }

}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product(id: "1", name: "cupandsaucer", image: "cupandsaucer_2x", price: 10, description: "aaa"))
            .environmentObject(CartManager())
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: Product(id: "1", name: "cupandsaucer", image: "cupandsaucer_2x", price: 10))
//            .environmentObject(CartManager())
//    }
//}

