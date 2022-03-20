//
//  ContentView.swift
//  AR-online-shopping-iOS
//
//  Created by Ashkan Goharfar on 2022-03-19.
//

import SwiftUI
import RealityKit

// This library is added, to allow user to add AR objects in the physical space
import ARKit

struct ContentView : View {
    @State private var isPlacementEnabled = false
    @State private var selectedModelImage: String?
    @State private var modelImageConfirmedForPlacement: String?
    
    var modelImages: [String] = {
       // Dynamically get our modelImage file name
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
                return []
        }
        
        var availableModelImages: [String] = []
        for filename in files where filename.hasSuffix("usdz") {
            let modelImageName = filename.replacingOccurrences(of: ".usdz", with: "")
            availableModelImages.append(modelImageName)
        }
        
        return availableModelImages
    }()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelImageConfirmedForPlacement: self.$modelImageConfirmedForPlacement)
            
            if self.isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModelImage: $selectedModelImage, modelImageConfirmedForPlacement: self.$modelImageConfirmedForPlacement)
            } else {
                // we pass $ sign because isPlacementEnable is binding variable, binding variable is a property that has its source of truth outside of the model picker view (in our case it is in main content view). So, by adding $ sign we have read/write access to the variable, if we dont add $ sign, then we just have read access.
                ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModelImage: self.$selectedModelImage, modelImages: self.modelImages)
            }
            
            

        }
    }
}
    

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelImageConfirmedForPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        
        // Enable plane tracking
        config.planeDetection = [.horizontal, .vertical]

        // Enable environment textureing
        config.environmentTexturing = .automatic
        
        // If we have a device that has light our scene reconstruction capabilities
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // we do not use $ here because we are just reading the value
        if let modelImageName = self.modelImageConfirmedForPlacement {
            
            print("DEBUG: adding model image to scene - \(modelImageName)")
            
            let filename = modelImageName + ".usdz"
            let modelImageEntity = try! ModelEntity.loadModel(named: filename)
            
            let anchorEntity = AnchorEntity(plane: .any)
            anchorEntity.addChild(modelImageEntity)
            
            uiView.scene.addAnchor(anchorEntity)
            
            
            
            /* If we assign the value to variable here is gonna make error, because we are assigning it inside the same variable and the UI is stil processing the variable.
             So we have to wrap the variable to dispach queue to asychronoous block.*/
//            self.modelImageConfirmedForPlacement = nil
            DispatchQueue.main.async {
                self.modelImageConfirmedForPlacement = nil
            }
        }
    }
    
}

struct ModelPickerView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModelImage: String?
    
    var modelImages: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.modelImages.count) { index in
                    Button(action: {
                        print("DEBUG: selected model with name: \(self.modelImages[index])")
                        
                        self.selectedModelImage = self.modelImages[index]
                        
                        self.isPlacementEnabled = true
                    }) {
                        Image(uiImage: UIImage(named: self.modelImages[index])!)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                        
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    .padding(20)
    .background(Color.black.opacity(0.5))
    }
}

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModelImage: String?
    @Binding var modelImageConfirmedForPlacement: String?
    
    var body: some View {
        HStack {
            // Cancel Button
            Button(action: {
                print("DEBUG: Model image placement cancel.")
                
                self.resetPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            // Confirm Button
            Button(action: {
                print("DEBUG: Model image placement confirmed.")
                
                self.modelImageConfirmedForPlacement = self.selectedModelImage
                
                self.resetPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModelImage = nil
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
