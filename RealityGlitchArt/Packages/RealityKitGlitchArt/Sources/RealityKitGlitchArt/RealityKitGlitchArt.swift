import Foundation

/// Bundle for the RealityKitGlitchArt project
public let realityKitGlitchArtBundle = Bundle.module
public let glitchArtMaterialNamePrefix = "/Root/"
public let glitchArtMaterialPathPrefix = "Materials/"


public enum GlitchArtMaterial: String, CaseIterable, Identifiable, Codable, Sendable {
    public var id: String {
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
    
    case DigitalStripeHMaterial
    case DigitalStripeVMaterial
    
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
