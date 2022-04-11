//
//  NewPostModel.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-31.
//

import Foundation

struct NewPostModel: Identifiable,Hashable {
    
    // Mirror data and data types in firebase database
    var id: String
    var name: String
    var post: String
    var imageName: String
    var time: Double
}
