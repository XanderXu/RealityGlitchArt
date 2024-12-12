//
//  AppModel.swift
//  RealityGlitchArt
//
//  Created by 许同学 on 2024/6/23.
//

import SwiftUI
import RealityGlitchArt
/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    var selectedMaterial: GlitchArtMaterial = .RGBSplitMaterial
}

