//
//  ImmersiveView.swift
//  VisionOSGlitchArt
//
//  Created by 许同学 on 2024/6/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(AppModel.self) private var model
    @State private var entity: Entity? = nil
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                print(immersiveContentEntity)
                entity = immersiveContentEntity
            }
        }
        .onChange(of: model.selectedMaterial) { oldValue, newValue in
            Task {
                do {
                    let materialEntity = try await Entity(named: "Materials/"+newValue.rawValue, in: realityKitContentBundle)
                    print(materialEntity)
                    
                } catch {
                    print(error)
                }
//                if let materialEntity = try? await Entity(named: newValue.rawValue, in: realityKitContentBundle) {
//                    
//                    print(materialEntity)
//                }
                
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
