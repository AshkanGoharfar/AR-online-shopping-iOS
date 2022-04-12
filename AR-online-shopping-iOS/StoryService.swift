//
//  StoryService.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-04-12.
//

import Foundation
import Firebase
import FirebaseFirestore
//import FireStore

class StoryService: ObservableObject {
    
    @Published var list = [StoryModel]()

    func getData(){
        // Get a reference to the database
        let db = Firestore.firestore()
        
        
        // Read the documents at a specific path
        db.collection("stories").getDocuments { snapshot, error in

            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            
                            // Create our class item (object) for each document returned
                            return StoryModel(id: d.documentID,
                                        // as we don't know what is the type of data, we are gonna cast it as string
                                              title: d["title"] as? String ?? "",
                                              description: d["description"] as? String ?? "",
                                              image: d["image"] as? String ?? "")
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

