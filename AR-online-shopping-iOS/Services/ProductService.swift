//
//  ProductService.swift
//  AR-online-shopping-iOS
//
//  Created by Shirin Mansouri on 2022-04-11.
//

import Foundation
import Firebase
import FirebaseFirestore
//import FireStore
//This is for communicating with Firebase for products
class ProductService: ObservableObject {
    
    @Published var list = [Product]()
    
    //This adds data to the database
    func addData(name: String, image: String, price: Int, description: String){
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Get a document to the collection
        // the first parameter is the data that we put in to the document and the scond is the result of code that we run after once
        db.collection("products").addDocument(data: ["name": name, "image": image, "price": price, "description": description]) { error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                
                // Call get Data to retreive latest data (update the UI after having new data)
                self.getData()
            }
            else {
                // Handle the error
            }
        }
    }
    //This fetches data from the database
    func getData(){
        // Get a reference to the database
        let db = Firestore.firestore()
        
        
        // Read the documents at a specific path
        db.collection("products").getDocuments { snapshot, error in

            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Products
                        self.list = snapshot.documents.map { d in
                            
                            // Create our class item (object) for each document returned
                            return Product(id: d.documentID as? String ?? "",
                                        // as we don't know what is the type of data, we are gonna cast it as string
                                        name: d["name"] as? String ?? "",
                                        image: d["image"] as? String ?? "",
                                        price: d["price"] as? Int ?? 0,
                                        description: d["description"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                // Handle the error
                print("Listen for query at failed: Missing or insufficient permissions :(")
            }
        }
    }
}

