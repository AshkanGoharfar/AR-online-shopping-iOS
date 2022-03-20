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
    @State private var selectedModelImage: Model3D?
    @State private var modelImageConfirmedForPlacement: Model3D?
    
    var modelImages: [Model3D] = {
       // Dynamically get our modelImage file name
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
                return []
        }
        
        var availableModelImages: [Model3D] = []
        for filename in files where filename.hasSuffix("usdz") {
            let modelImageName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model3D = Model3D(model3DName: modelImageName)
            availableModelImages.append(model3D)
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
    @Binding var modelImageConfirmedForPlacement: Model3D?
    
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
        if let model3D = self.modelImageConfirmedForPlacement {
            
            if let model3DEntity = model3D.model3DEntity {
                print("DEBUG: adding model to scene - \(model3D.model3DName)")
                
                let anchorEntity = AnchorEntity(plane: .any)
                
                anchorEntity.addChild(model3DEntity)
                anchorEntity.addChild(model3DEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
                
            } else {
                print("DEBUG: Unable to load model3DEntity for \(model3D.model3DName)")
            }

            
            
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
    @Binding var selectedModelImage: Model3D?
    
    var modelImages: [Model3D]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.modelImages.count) { index in
                    Button(action: {
                        print("DEBUG: selected model with name: \(self.modelImages[index].model3DName)")
                        
                        self.selectedModelImage = self.modelImages[index]
                        
                        self.isPlacementEnabled = true
                    }) {
                        Image(uiImage: self.modelImages[index].image)
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
    @Binding var selectedModelImage: Model3D?
    @Binding var modelImageConfirmedForPlacement: Model3D?
    
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
