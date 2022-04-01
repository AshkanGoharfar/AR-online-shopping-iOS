//
//  NewPostService.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-31.
//

import Foundation
import Firebase
import FirebaseFirestore
//import FireStore

class NewPostService: ObservableObject {
    
    @Published var list = [NewPostModel]()
    
//    func updateData(todoToUpdate: NewPostModel) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Set the data to update
//        db.collection("newPost").document(todoToUpdate.id).setData(["name": "Updated:\(todoToUpdate.name)"], merge: true) { error in
//
//            // Check for error
//            if error == nil {
//
//                // Get the new data
//                self.getData()
//            }
//        }
//    }
    
//    func deleteData(todoToDelete: Todo) {
//
//        // Get a reference from the Database
//        let db = Firestore.firestore()
//
//        // Specify the document to delete
//        db.collection("todos").document(todoToDelete.id).delete { error in
//
//            // Check for errors
//            if error == nil {
//                // No errors
//
//                // Update the UI from the main thread
//                DispatchQueue.main.async {
//
//                    // Remove the todo that was just delete
//                    self.list.removeAll { todo in
//
//                        // Check for the todo to remove
//                        return todo.id == todoToDelete.id
//                    }
//                }
//
//            }
//        }
//    }
    
    func addData(name: String, notes: String, imageName: String){
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Get a document to the collection
        // the first parameter is the data that we put in to the document and the scond is the result of code that we run after once
        db.collection("newPost").addDocument(data: ["name": name, "post": notes, "imageName": imageName]) { error in
            
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
    
    func getData(){
        // Get a reference to the database
        let db = Firestore.firestore()
        
        
        // Read the documents at a specific path
        db.collection("newPost").getDocuments { snapshot, error in

            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.list = snapshot.documents.map { d in
                            
                            // Create our class item (object) for each document returned
                            return NewPostModel(id: d.documentID,
                                        // as we don't know what is the type of data, we are gonna cast it as string
                                        name: d["name"] as? String ?? "",
                                        post: d["post"] as? String ?? "",
                                                imageName: d["imageName"] as? String ?? "")
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

