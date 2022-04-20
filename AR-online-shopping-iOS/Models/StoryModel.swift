//
//  StoryModel.swift
//  AR-online-shopping-iOS
//
//  Created by Ali Roudak on 2022-04-12.
//

import Foundation
//This struct is to support offers which appear on the home page of the app
struct StoryModel: Identifiable,Hashable {
    
    // Mirror data and data types in firebase database
    var id: String
    var title: String
    var description: String
    var image: String
}
