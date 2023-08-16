//
//  HomeViewController.swift
//  ARCubeShooter
//
//  Created by Oh!ara on 2023/08/17.
//

import UIKit
import RealityKit
import ARKit

class HomeViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var arView: ARView!
    

    
    // MARK: - 変数
    var anchor: AnchorEntity?
    
    var cubeModel: ModelEntity?
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        
        makeCube()
        
    }
    
    
    // MARK: - 関数
    
    // arの設定
    func setupAR() {
        // デリゲートの設定
        arView.session.delegate = self
        arView.debugOptions = [.showWorldOrigin]

        arView.environment.sceneUnderstanding.options = [.collision]
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        
        arView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    
        
    }
    
    
    
    func makeCube() {
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        anchor?.position = simd_make_float3(0, -0.5, -1)
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.3, 0.3, 0.3])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        let cube = ModelEntity(mesh: mesh, materials: [material])
        
        anchor?.addChild(cube)
        // 追加
        arView.scene.addAnchor(anchor!)
        
    }
    
   
}

// MARK: - extension
extension HomeViewController: ARSessionDelegate {
    
}
