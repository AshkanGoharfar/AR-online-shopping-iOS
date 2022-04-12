//
//  StoryModel.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-04-12.
//

import Foundation

struct StoryModel: Identifiable,Hashable {
    
    // Mirror data and data types in firebase database
    var id: String
    var title: String
    var description: String
    var image: String
}
