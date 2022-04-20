//
//  Product.swift
//  AR-online-shopping-iOS
//
//  Created by Ali Roudak on 2022-03-22.
//

import Foundation
//This struct is to support products which are sold on the app
struct Product: Identifiable,Hashable {
    
    // Mirror data and data types in firebase database
    var id: String
    var name: String
    var image: String
    var price: Int
    var description: String
}
