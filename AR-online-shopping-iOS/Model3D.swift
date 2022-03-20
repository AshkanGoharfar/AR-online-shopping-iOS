//
//  Model3D.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-20.
//
// This class was created to deal with async loading in updateView function in ARViewContainer struct
import UIKit
import RealityKit
import Combine

class Model3D {
    var model3DName: String
    var image: UIImage
    
    // Use ? to make the variable optional, which means that it could be nil
    var model3DEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(model3DName: String) {
        self.model3DName = model3DName
        
        // Since it is optional we are gonna wrapped by (!) because we know that are thumbnail exists
        self.image = UIImage(named: model3DName)!
        
        let fileName = model3DName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
        // there is two clusore in there, the first is recieved completion, and the second is recieve value
            .sink(receiveCompletion: { loadCompletion in
                // Handle our error
                print("DEBUG: Unable to load model3DEntity for modelName: \(self.model3DName)")
            }, receiveValue: { model3DEntity in
                // Get our modelEntity
                self.model3DEntity = model3DEntity
                print("DEBUG: Successfully loaded model3DEntity from model3DName: \(self.model3DName)")
            })
    }
    
    
}
