//
//  Product.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

// we do not set up the id here, because its already set up in the model
var productList = [
    Product(name: "cupandsaucer", image: "cupandsaucer_2x", price: 10),
    Product(name: "gramophone", image: "gramophone_2x", price: 15),
    Product(name: "redchair", image: "redchair_2x", price: 12),
    Product(name: "teapot", image: "teapot_2x", price: 45)
]
