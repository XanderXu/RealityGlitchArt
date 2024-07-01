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
//                print(immersiveContentEntity)
                entity = immersiveContentEntity
            }
        }
        .onChange(of: model.selectedMaterial) { oldValue, newValue in
            Task {
                do {
                    let sgm = try await ShaderGraphMaterial(named: shaderGraphNamePrefix+newValue.rawValue, from: shaderGraphPathPrefix+newValue.rawValue, in: realityKitContentBundle)
                    entity?.forEachDescendant(withComponent: ModelComponent.self) { modelEntity, component in
                        var modelComponent = component
                        modelComponent.materials = [sgm]
    //                    print(modelEntity, modelComponent)
                        modelEntity.components[ModelComponent.self] = modelComponent
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
public extension Entity {
    
    /// Recursive search of children looking for any descendants with a specific component and calling a closure with them.
    func forEachDescendant<T: Component>(withComponent componentClass: T.Type, _ closure: (Entity, T) -> Void) {
        for child in children {
            if let component = child.components[componentClass] {
                closure(child, component)
            }
            child.forEachDescendant(withComponent: componentClass, closure)
        }
    }
}
