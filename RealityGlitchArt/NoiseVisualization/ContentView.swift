//
//  ContentView.swift
//  NoiseVisualization
//
//  Created by 许同学 on 2024/7/7.
//

import SwiftUI
import RealityKit
import RealityKitNoise

struct ContentView: View {

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitNoiseBundle)
                .padding(.bottom, 50)

            Text("Hello, noise!")

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
