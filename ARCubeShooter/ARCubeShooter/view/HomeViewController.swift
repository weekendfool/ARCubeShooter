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
    
    @IBOutlet weak var numberOfCubesSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var makeButton: UIButton!
    
    // MARK: - 変数
    var anchor: AnchorEntity?
    
    var cubeModel: ModelEntity?
    
    var worldAnchor: AnchorEntity?
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        
//        makeCube()
        makeNineCubes()
        
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
        
        // 原点取得
        worldAnchor = AnchorEntity(world: [0, 0, 0])
        arView.scene.addAnchor(worldAnchor!)
    
        
    }
    
    
    
    func makeCube() {
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        anchor?.position = simd_make_float3(0, -0.5, -1.5)
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.9, 0.9, 0.9])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        let cube = ModelEntity(mesh: mesh, materials: [material])
        
        anchor?.addChild(cube)
        // 追加
        arView.scene.addAnchor(anchor!)
        
    }
    
    // キューブ生成：一個
    func makeACube() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
        }
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        anchor?.position = simd_make_float3(0, -0.5, -1.5)
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.9, 0.9, 0.9])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        let cube = ModelEntity(mesh: mesh, materials: [material])
        
        anchor?.addChild(cube)
        // 追加
        arView.scene.addAnchor(anchor!)
        
    }
    
    // キューブ生成：９個
    func makeNineCubes() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
        }
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        // カメラ座標
        let infrontOfCamera = SIMD3<Float>(x: 0, y: 0, z: -0.05)
        // カメラ座標　→ ワールド座標
        let cubePositon = anchor?.convert(position: infrontOfCamera, to: worldAnchor)
        
//        anchor?.position = simd_make_float3(0, -0.5, -1.5)
        anchor?.position = cubePositon!
        
        // 弾丸発射
        // 着弾点のアンカー
        let goalAnchor = AnchorEntity()
        // 着弾点(カメラ座標？）
        let goalPositionOnLocal = SIMD3<Float>(x: 0, y: 0, z: -1)
        // 着弾点(ワールド座標？）
        let goalPositionOnOrigen = goalAnchor.convert(position: goalPositionOnLocal, to: worldAnchor)
        
        let movePosition = float4x4.init(translation: goalPositionOnOrigen)
        
        
        
        // cube実装
        let size = Float(0.09 / 3.0)
        let length = size + size / 5
        let mesh = MeshResource.generateBox(size: [size, size, size])
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.9), isMetallic: false)
        
        // 1
        
        let firstCube1 = ModelEntity(mesh: mesh, materials: [material])
        firstCube1.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        
        let secondCube1 = ModelEntity(mesh: mesh, materials: [material])
        secondCube1.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), (anchor?.position.z)!)
        
        let thirdCube1 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube1.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        
        let fourthCube1 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube1.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, (anchor?.position.z)!)
        
        let fifthCube1 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube1.position = anchor!.position
        
        let sixthCube1 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube1.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, (anchor?.position.z)!)
        
        let seventhCube1 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube1.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        
        let eighthCube1 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube1.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), (anchor?.position.z)!)
        
        let ninethCube1 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube1.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        
        // 2
        let firstCube2 = ModelEntity(mesh: mesh, materials: [material])
        firstCube2.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        
        let secondCube2 = ModelEntity(mesh: mesh, materials: [material])
        secondCube2.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        
        let thirdCube2 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube2.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        
        let fourthCube2 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube2.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        
        let fifthCube2 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube2.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length))
        
        let sixthCube2 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube2.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        
        let seventhCube2 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube2.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        
        let eighthCube2 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube2.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        
        let ninethCube2 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube2.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        
        // 3
        let firstCube3 = ModelEntity(mesh: mesh, materials: [material])
        firstCube3.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        
        let secondCube3 = ModelEntity(mesh: mesh, materials: [material])
        secondCube3.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        
        let thirdCube3 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube3.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        
        let fourthCube3 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube3.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        
        let fifthCube3 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube3.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length))
        
        let sixthCube3 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube3.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        
        let seventhCube3 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube3.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        
        let eighthCube3 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube3.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        
        let ninethCube3 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube3.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        
        
        
        // センターキューブ
//        let cube = ModelEntity(mesh: mesh, materials: [material])
//        cube.position = anchor!.position
        
//        centerAnchor.addChild(cube)
        anchor?.addChild(firstCube1)
        anchor?.addChild(secondCube1)
        anchor?.addChild(thirdCube1)
        
        anchor?.addChild(fourthCube1)
        anchor?.addChild(fifthCube1)
        anchor?.addChild(sixthCube1)
        
        anchor?.addChild(seventhCube1)
        anchor?.addChild(eighthCube1)
        anchor?.addChild(ninethCube1)
        
        anchor?.addChild(firstCube2)
        anchor?.addChild(secondCube2)
        anchor?.addChild(thirdCube2)
        
        anchor?.addChild(fourthCube2)
        anchor?.addChild(fifthCube2)
        anchor?.addChild(sixthCube2)
        
        anchor?.addChild(seventhCube2)
        anchor?.addChild(eighthCube2)
        anchor?.addChild(ninethCube2)
        
        anchor?.addChild(firstCube3)
        anchor?.addChild(secondCube3)
        anchor?.addChild(thirdCube3)
        
        anchor?.addChild(fourthCube3)
        anchor?.addChild(fifthCube3)
        anchor?.addChild(sixthCube3)
        
        anchor?.addChild(seventhCube3)
        anchor?.addChild(eighthCube3)
        anchor?.addChild(ninethCube3)
        
        // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
    }
    
    
    
    @IBAction func tappedMakeButton(_ sender: Any) {
    }
    
}

// MARK: - extension
extension HomeViewController: ARSessionDelegate {
    
}

extension float4x4 {
    
    init(translation vector: SIMD3<Float>) {
        self.init(
            .init(1, 0, 0, 0),
            .init(0, 1, 0, 0),
            .init(0, 0, 1, 0),
            .init(vector.x, vector.y, vector.z, 1)
        )
    }
}
