//
//  AppModel.swift
//  VisionOSGlitchArt
//
//  Created by 许同学 on 2024/6/23.
//

import SwiftUI

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
    var selectedMaterial: GlitchMaterial = .RGBSplitMaterial
}

enum GlitchMaterial: String, CaseIterable, Identifiable {
    var id: String {
        return rawValue
    }
    
    case RGBSplitMaterial
    case RGBSplitMaterialV2
    case RGBSplitMaterialV3
    case RGBSplitMaterialV4
    case RGBSplitMaterialV5
    
    case ImageBlockMaterial
    case ImageBlockMaterialV2
    case ImageBlockMaterialV3
    case ImageBlockMaterialV4
    
    case AnalogNoiseMaterial
    
    case LineBlockHMaterial
    case LineBlockVMaterial
    
    case DigitalStripeHMaterial//todo
    case DigitalStripeVMaterial//todo
    
    case ScanLineJitterHMaterial
    case ScanLineJitterVMaterial
    
    case TileJitterHMaterial
    case TileJitterVMaterial
    
    case WaveJitterHMaterial
    case WaveJitterVMaterial
    
    case ScreenJumpHMaterial
    case ScreenJumpVMaterial
    
    case ScreenShakeHMaterial
    case ScreenShakeVMaterial
}
