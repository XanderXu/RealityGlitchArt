//
//  ContentView.swift
//  VisionOSGlitchArt
//
//  Created by 许同学 on 2024/6/23.
//

import SwiftUI
import RealityKit
import RealityKitGlitchArt

struct ContentView: View {
    @Environment(AppModel.self) private var model
    var body: some View {
        @Bindable var model = model
        VStack {
            Model3D(named: "Scene", bundle: realityKitGlitchArtBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
            Text(model.selectedMaterial.rawValue)

            ToggleImmersiveSpaceButton()
            
            Picker(selection: $model.selectedMaterial) {
                ForEach(GlitchMaterial.allCases) {m in
                    Text(m.rawValue)
                        .tag(m)
                }
            } label: {
                Text("GlitchMaterials")
            }
            .disabled(model.immersiveSpaceState == .closed)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
