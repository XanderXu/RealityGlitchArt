//
//  ImmersiveView.swift
//  RealityGlitchArt
//
//  Created by 许同学 on 2024/6/23.
//

import SwiftUI
import RealityKit
import RealityKitGlitchArt

struct ImmersiveView: View {
    @Environment(AppModel.self) private var model
    @State private var entity: Entity? = nil
    
    @State private var textureResource: TextureResource?
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitGlitchArtBundle) {
                content.add(immersiveContentEntity)
                entity = immersiveContentEntity
            }
//            textureResource = try? await TextureResource(named: "numberR")
            textureResource = try? await TextureResource(named: "number")
        }
        .onChange(of: model.selectedMaterial) { oldValue, newValue in
            Task {
                do {
                    var sgm = try await ShaderGraphMaterial(named: glitchArtMaterialNamePrefix+newValue.rawValue, from: glitchArtMaterialPathPrefix+newValue.rawValue, in: realityKitGlitchArtBundle)
                    entity?.forEachDescendant(withComponent: ModelComponent.self) { modelEntity, component in
                        var modelComponent = component
                        modelComponent.materials = modelComponent.materials.map {_ in 
                            do {
                                if sgm.parameterNames.contains("ConstantImageFile") {
                                    try sgm.setParameter(name: "ConstantImageFile", value: MaterialParameters.Value.textureResource(textureResource!))
                                }
                                
                            } catch {
                                print("Error setting ride_running material parameter: \(error.localizedDescription)")
                            }
                            return sgm
                        }
                        modelEntity.modelComponent = modelComponent
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
    
    var collisionComponent: CollisionComponent? {
        get { components[CollisionComponent.self] }
        set { components[CollisionComponent.self] = newValue }
    }
    
    /// Property for getting or setting an entity's `ModelComponent`.
    var modelComponent: ModelComponent? {
        get { components[ModelComponent.self] }
        set { components[ModelComponent.self] = newValue }
    }
    
    var particleEmitterComponent: ParticleEmitterComponent? {
        get { components[ParticleEmitterComponent.self] }
        set { components[ParticleEmitterComponent.self] = newValue }
    }
}
