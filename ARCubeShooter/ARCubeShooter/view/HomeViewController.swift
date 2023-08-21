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
    
    var cubeModels: [ModelEntity] = []
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        
//        makeCube()
//        makeSixteenCubes()
        
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
            anchor.removeFromParent()
        }
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        // カメラ座標
        let infrontOfCamera = SIMD3<Float>(x: 0, y: 0, z: -0.05)
        // カメラ座標　→ ワールド座標
        let cubePositon = anchor?.convert(position: infrontOfCamera, to: worldAnchor)
        
//        anchor?.position = simd_make_float3(0, -0.5, -1.5)
//        anchor?.position = cubePositon!
        
        anchor?.position = infrontOfCamera
        
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.09, 0.09, 0.09])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        let cube = ModelEntity(mesh: mesh, materials: [material])
        
        anchor?.addChild(cube)
        // 追加
        arView.scene.addAnchor(anchor!)
        
    }
    
    // キューブ生成：4個
    func makeFourCubes() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
            anchor.removeFromParent()
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
        let size = Float(0.09 / 2.0)
        let length = size + size / 5
        let mesh = MeshResource.generateBox(size: [size, size, size])
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.9), isMetallic: false)
        
//        let material2 = SimpleMaterial(color: .red, isMetallic: false)
//        let center = ModelEntity(mesh: mesh, materials: [material2])
//        center.position = anchor!.position
        
        // 1
        
        let firstCube1 = ModelEntity(mesh: mesh, materials: [material])
        firstCube1.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        
        let secondCube1 = ModelEntity(mesh: mesh, materials: [material])
        secondCube1.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        
        
        let thirdCube1 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube1.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
        let fourthCube1 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube1.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
     
        // 2
        let firstCube2 = ModelEntity(mesh: mesh, materials: [material])
        firstCube2.position =  simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        
        let secondCube2 = ModelEntity(mesh: mesh, materials: [material])
        secondCube2.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        
        let thirdCube2 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube2.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        
        let fourthCube2 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube2.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        
//        anchor!.addChild(center)
        
        cubeModels.append(firstCube1)
        cubeModels.append(secondCube1)
        cubeModels.append(thirdCube1)
        cubeModels.append(fourthCube1)
        cubeModels.append(firstCube2)
        cubeModels.append(secondCube2)
        cubeModels.append(thirdCube2)
        cubeModels.append(fourthCube2)
        
        anchor?.addChild(firstCube1)
        anchor?.addChild(secondCube1)
        anchor?.addChild(thirdCube1)
        
        anchor?.addChild(fourthCube1)
         
        anchor?.addChild(firstCube2)
        anchor?.addChild(secondCube2)
        anchor?.addChild(thirdCube2)
        anchor?.addChild(fourthCube2)
      
        // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
//        }
        
    }
    
    // キューブ生成：９個
    func makeNineCubes() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
            anchor.removeFromParent()
            for model in cubeModels {
                self.anchor?.removeChild(model)
            }
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
    
    // キューブ生成：16個
    func makeSixteenCubes() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
            anchor.removeFromParent()
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
        let size = Float(0.09 / 4.0)
        let length = size + size / 7
        let mesh = MeshResource.generateBox(size: [size, size, size])
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.9), isMetallic: false)
        
       
        // row - column - Strata(行 - 列 - 層)
        
        // 1行目
        // 1-1-1
        let firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 1-1-2
        let firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 1-1-3
        let firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 1-1-4
        let firstRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 1-2-1
        let firstRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 1-2-2
        let firstRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 1-2-3
        let firstRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 1-2-4
        let firstRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 1-3-1
        let firstRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 1-3-2
        let firstRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 1-3-3
        let firstRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 1-3-4
        let firstRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 1-4-1
        let firstRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! + length / 2 * 3))
        // 1-4-2
        let firstRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! + length / 2))
        // 1-4-3
        let firstRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! - length / 2))
        // 1-4-4
        let firstRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 2行目
        // 2-1-1
        let secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 2-1-2
        let secondRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 2-1-3
        let secondRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 2-1-4
        let secondRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        
        // 2-2-1
        let secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 2-2-2
        let secondRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 2-2-3
        let secondRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 2-2-4
        let secondRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
        
        
        // 2-3-1
        let secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 2-3-2
        let secondRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 2-3-3
        let secondRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 2-3-4
        let secondRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 2-4-1
        let secondRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 2-4-2
        let secondRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 2-4-3
        let secondRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 2-4-4
        let secondRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 3行目
        // 3-1-1
        let thirdRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 3-1-2
        let thirdRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 3-1-3
        let thirdRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 3-1-4
        let thirdRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 3-2-1
        let thirdRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 3-2-2
        let thirdRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 3-2-3
        let thirdRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 3-2-4
        let thirdRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        // 3-3-1
        let thirdRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 3-3-2
        let thirdRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 3-3-3
        let thirdRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 3-3-4
        let thirdRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 3-4-1
        let thirdRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 3-4-2
        let thirdRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 3-4-3
        let thirdRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 3-4-4
        let thirdRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        // 4行目
        // 4-1-1
        let fourthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 4-1-2
        let fourthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 4-1-3
        let fourthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 4-1-4
        let fourthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 4-2-1
        let fourthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 4-2-2
        let fourthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 4-2-3
        let fourthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 4-2-4
        let fourthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
    
        // 4-3-1
        let fourthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 4-3-2
        let fourthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 4-3-3
        let fourthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 4-3-4
        let fourthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
        
        // 4-4-1
        let fourthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 4-4-2
        let fourthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 4-4-3
        let fourthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 4-4-4
        let fourthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
        
               
        
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube)
        anchor?.addChild(firstRowFirstCulmnSecondStrataCube)
        anchor?.addChild(firstRowFirstCulmnThirdStrataCube)
        anchor?.addChild(firstRowFirstCulmnFourthStrataCube)
        
        anchor?.addChild(firstRowSecondCulmnFirstStrataCube)
        anchor?.addChild(firstRowSecondCulmnSecondStrataCube)
        anchor?.addChild(firstRowSecondCulmnThirdStrataCube)
        anchor?.addChild(firstRowSecondCulmnFourthStrataCube)
        
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube)
        anchor?.addChild(firstRowThirdCulmnSecondStrataCube)
        anchor?.addChild(firstRowThirdCulmnThirdStrataCube)
        anchor?.addChild(firstRowThirdCulmnFourthStrataCube)
        
        anchor?.addChild(firstRowFourthCulmnFirstStrataCube)
        anchor?.addChild(firstRowFourthCulmnSecondStrataCube)
        anchor?.addChild(firstRowFourthCulmnThirdStrataCube)
        anchor?.addChild(firstRowFourthCulmnFourthStrataCube)
        
        // 2
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube)
        anchor?.addChild(secondRowFirstCulmnSecondStrataCube)
        anchor?.addChild(secondRowFirstCulmnThirdStrataCube)
        anchor?.addChild(secondRowFirstCulmnFourthStrataCube)
        
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube)
        anchor?.addChild(secondRowSecondCulmnSecondStrataCube)
        anchor?.addChild(secondRowSecondCulmnThirdStrataCube)
        anchor?.addChild(secondRowSecondCulmnFourthStrataCube)
        
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube)
        anchor?.addChild(secondRowThirdCulmnSecondStrataCube)
        anchor?.addChild(secondRowThirdCulmnThirdStrataCube)
        anchor?.addChild(secondRowThirdCulmnFourthStrataCube)
        
        anchor?.addChild(secondRowFourthCulmnFirstStrataCube)
        anchor?.addChild(secondRowFourthCulmnSecondStrataCube)
        anchor?.addChild(secondRowFourthCulmnThirdStrataCube)
        anchor?.addChild(secondRowFourthCulmnFourthStrataCube)
        
        // 3
        anchor?.addChild(thirdRowFirstCulmnFirstStrataCube)
        anchor?.addChild(thirdRowFirstCulmnSecondStrataCube)
        anchor?.addChild(thirdRowFirstCulmnThirdStrataCube)
        anchor?.addChild(thirdRowFirstCulmnFourthStrataCube)
        
        anchor?.addChild(thirdRowSecondCulmnFirstStrataCube)
        anchor?.addChild(thirdRowSecondCulmnSecondStrataCube)
        anchor?.addChild(thirdRowSecondCulmnThirdStrataCube)
        anchor?.addChild(thirdRowSecondCulmnFourthStrataCube)
        
        anchor?.addChild(thirdRowThirdCulmnFirstStrataCube)
        anchor?.addChild(thirdRowThirdCulmnSecondStrataCube)
        anchor?.addChild(thirdRowThirdCulmnThirdStrataCube)
        anchor?.addChild(thirdRowThirdCulmnFourthStrataCube)
        
        anchor?.addChild(thirdRowFourthCulmnFirstStrataCube)
        anchor?.addChild(thirdRowFourthCulmnSecondStrataCube)
        anchor?.addChild(thirdRowFourthCulmnThirdStrataCube)
        anchor?.addChild(thirdRowFourthCulmnFourthStrataCube)
        
        // 4
        anchor?.addChild(fourthRowFirstCulmnFirstStrataCube)
        anchor?.addChild(fourthRowFirstCulmnSecondStrataCube)
        anchor?.addChild(fourthRowFirstCulmnThirdStrataCube)
        anchor?.addChild(fourthRowFirstCulmnFourthStrataCube)
        
        anchor?.addChild(fourthRowSecondCulmnFirstStrataCube)
        anchor?.addChild(fourthRowSecondCulmnSecondStrataCube)
        anchor?.addChild(fourthRowSecondCulmnThirdStrataCube)
        anchor?.addChild(fourthRowSecondCulmnFourthStrataCube)
        
        anchor?.addChild(fourthRowThirdCulmnFirstStrataCube)
        anchor?.addChild(fourthRowThirdCulmnSecondStrataCube)
        anchor?.addChild(fourthRowThirdCulmnThirdStrataCube)
        anchor?.addChild(fourthRowThirdCulmnFourthStrataCube)
        
        anchor?.addChild(fourthRowFourthCulmnFirstStrataCube)
        anchor?.addChild(fourthRowFourthCulmnSecondStrataCube)
        anchor?.addChild(fourthRowFourthCulmnThirdStrataCube)
        anchor?.addChild(fourthRowFourthCulmnFourthStrataCube)
        
        
        
        
      
        // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
//        }
        
    }
    
    // キューブ生成：25個
    func makeTwentyFiveCubes() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
            anchor.removeFromParent()
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
        let size = Float(0.09 / 5.0)
        let length = size + size / 9
        let mesh = MeshResource.generateBox(size: [size, size, size])
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.9), isMetallic: false)
        
        let firstCube1 = ModelEntity(mesh: mesh, materials: [material])
        // row - column - Strata(行 - 列 - 層)
        
        // 1行目
        // 1-1-1
        let firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 1-1-2
        let firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! + length))
        // 1-1-3
        let firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), (anchor?.position.z)!)
        // 1-1-4
        let firstRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! - length))
        // 1-1-5
        let firstRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! - length * 2))
        
        // 1-2-1
        let firstRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! + length * 2))
        // 1-2-2
        let firstRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! + length))
        // 1-2-3
        let firstRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 1-2-4
        let firstRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! - length))
        // 1-2-5
        let firstRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! - length * 2))
        
        // 1-3-1
        let firstRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 1-3-2
        let firstRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 1-3-3
        let firstRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, (anchor?.position.z)!)
        // 1-3-4
        let firstRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 1-3-5
        let firstRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        // 1-4-1
        let firstRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 1-4-2
        let firstRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 1-4-3
        let firstRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 1-4-4
        let firstRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 1-4-5
        let firstRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        // 1-5-1
        let firstRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 1-5-2
        let firstRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 1-5-3
        let firstRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 1-5-4
        let firstRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 1-5-5
        let firstRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
        // 2行目
        // 2-1-1
        let secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 2-1-2
        let secondRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 2-1-3
        let secondRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 2-1-4
        let secondRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 2-1-5
        let secondRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        
        
        // 2-2-1
        let secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 2-2-2
        let secondRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 2-2-3
        let secondRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 2-2-4
        let secondRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 2-2-5
        let secondRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        
        // 2-3-1
        let secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 2-3-2
        let secondRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 2-3-3
        let secondRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, (anchor?.position.z)!)
        // 2-3-4
        let secondRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 2-3-5
        let secondRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        // 2-4-1
        let secondRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 2-4-2
        let secondRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 2-4-3
        let secondRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 2-4-4
        let secondRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 2-4-5
        let secondRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        // 2-5-1
        let secondRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 2-5-2
        let secondRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 2-5-3
        let secondRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 2-5-4
        let secondRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 2-5-5
        let secondRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
        // 3行目
        // 3-1-1
        let thirdRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFirstStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 3-1-2
        let thirdRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnSecondStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 3-1-3
        let thirdRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnThirdStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 3-1-4
        let thirdRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFourthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 3-1-5
        let thirdRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFifthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        
        // 3-2-1
        let thirdRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFirstStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 3-2-2
        let thirdRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnSecondStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 3-2-3
        let thirdRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnThirdStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 3-2-4
        let thirdRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFourthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 3-2-5
        let thirdRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFifthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
    
        // 3-3-1
        let thirdRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFirstStrataCube.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 3-3-2
        let thirdRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnSecondStrataCube.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 3-3-3
        let thirdRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnThirdStrataCube.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, (anchor?.position.z)!)
        // 3-3-4
        let thirdRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFourthStrataCube.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 3-3-5
        let thirdRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFifthStrataCube.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        // 3-4-1
        let thirdRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFirstStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 3-4-2
        let thirdRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnSecondStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 3-4-3
        let thirdRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnThirdStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 3-4-4
        let thirdRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFourthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 3-4-5
        let thirdRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFifthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        // 3-5-1
        let thirdRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFirstStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 3-5-2
        let thirdRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnSecondStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 3-5-3
        let thirdRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnThirdStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 3-5-4
        let thirdRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFourthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 3-5-5
        let thirdRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFifthStrataCube.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
        // 4行目
        // 4-1-1
        let fourthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 4-1-2
        let fourthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 4-1-3
        let fourthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 4-1-4
        let fourthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 4-1-5
        let fourthRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        
        // 4-2-1
        let fourthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 4-2-2
        let fourthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 4-2-3
        let fourthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 4-2-4
        let fourthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 4-2-5
        let fourthRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
    
        // 4-3-1
        let fourthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 4-3-2
        let fourthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 4-3-3
        let fourthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, (anchor?.position.z)!)
        // 4-3-4
        let fourthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 4-3-5
        let fourthRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        // 4-4-1
        let fourthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 4-4-2
        let fourthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 4-4-3
        let fourthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 4-4-4
        let fourthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 4-4-5
        let fourthRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        // 4-5-1
        let fourthRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 4-5-2
        let fourthRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 4-5-3
        let fourthRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 4-5-4
        let fourthRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 4-5-5
        let fourthRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
        // 5行目
        // 5-1-1
        let fifthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 5-1-2
        let fifthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 5-1-3
        let fifthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 5-1-4
        let fifthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 5-1-5
        let fifthRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        
        // 5-2-1
        let fifthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 5-2-2
        let fifthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 5-2-3
        let fifthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 5-2-4
        let fifthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 5-2-5
        let fifthRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        
        // 5-3-1
        let fifthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 5-3-2
        let fifthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 5-3-3
        let fifthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, (anchor?.position.z)!)
        // 5-3-4
        let fifthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 5-3-5
        let fifthRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        // 5-4-1
        let fifthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 5-4-2
        let fifthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 5-4-3
        let fifthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 5-4-4
        let fifthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 5-4-5
        let fifthRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        // 5-5-1
        let fifthRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFirstStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 5-5-2
        let fifthRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnSecondStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 5-5-3
        let fifthRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnThirdStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 5-5-4
        let fifthRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFourthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 5-5-5
        let fifthRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFifthStrataCube.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
       
       
        
        
        // センターキューブ
//        let cube = ModelEntity(mesh: mesh, materials: [material])
//        cube.position = anchor!.position
        
//        centerAnchor.addChild(cube)
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube)
        anchor?.addChild(firstRowFirstCulmnSecondStrataCube)
        anchor?.addChild(firstRowFirstCulmnThirdStrataCube)
        anchor?.addChild(firstRowFirstCulmnFourthStrataCube)
        anchor?.addChild(firstRowFirstCulmnFifthStrataCube)

        anchor?.addChild(firstRowSecondCulmnFirstStrataCube)
        anchor?.addChild(firstRowSecondCulmnSecondStrataCube)
        anchor?.addChild(firstRowSecondCulmnThirdStrataCube)
        anchor?.addChild(firstRowSecondCulmnFourthStrataCube)
        anchor?.addChild(firstRowSecondCulmnFifthStrataCube)
        
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube)
        anchor?.addChild(firstRowThirdCulmnSecondStrataCube)
        anchor?.addChild(firstRowThirdCulmnThirdStrataCube)
        anchor?.addChild(firstRowThirdCulmnFourthStrataCube)
        anchor?.addChild(firstRowThirdCulmnFifthStrataCube)
        
        anchor?.addChild(firstRowFourthCulmnFirstStrataCube)
        anchor?.addChild(firstRowFourthCulmnSecondStrataCube)
        anchor?.addChild(firstRowFourthCulmnThirdStrataCube)
        anchor?.addChild(firstRowFourthCulmnFourthStrataCube)
        anchor?.addChild(firstRowFourthCulmnFifthStrataCube)
        
        anchor?.addChild(firstRowFifthCulmnFirstStrataCube)
        anchor?.addChild(firstRowFifthCulmnSecondStrataCube)
        anchor?.addChild(firstRowFifthCulmnThirdStrataCube)
        anchor?.addChild(firstRowFifthCulmnFourthStrataCube)
        anchor?.addChild(firstRowFifthCulmnFifthStrataCube)
        
        // 2
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube)
        anchor?.addChild(secondRowFirstCulmnSecondStrataCube)
        anchor?.addChild(secondRowFirstCulmnThirdStrataCube)
        anchor?.addChild(secondRowFirstCulmnFourthStrataCube)
        anchor?.addChild(secondRowFirstCulmnFifthStrataCube)
        
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube)
        anchor?.addChild(secondRowSecondCulmnSecondStrataCube)
        anchor?.addChild(secondRowSecondCulmnThirdStrataCube)
        anchor?.addChild(secondRowSecondCulmnFourthStrataCube)
        anchor?.addChild(secondRowSecondCulmnFifthStrataCube)
        
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube)
        anchor?.addChild(secondRowThirdCulmnSecondStrataCube)
        anchor?.addChild(secondRowThirdCulmnThirdStrataCube)
        anchor?.addChild(secondRowThirdCulmnFourthStrataCube)
        anchor?.addChild(secondRowThirdCulmnFifthStrataCube)
        
        anchor?.addChild(secondRowFourthCulmnFirstStrataCube)
        anchor?.addChild(secondRowFourthCulmnSecondStrataCube)
        anchor?.addChild(secondRowFourthCulmnThirdStrataCube)
        anchor?.addChild(secondRowFourthCulmnFourthStrataCube)
        anchor?.addChild(secondRowFourthCulmnFifthStrataCube)
        
        anchor?.addChild(secondRowFifthCulmnFirstStrataCube)
        anchor?.addChild(secondRowFifthCulmnSecondStrataCube)
        anchor?.addChild(secondRowFifthCulmnThirdStrataCube)
        anchor?.addChild(secondRowFifthCulmnFourthStrataCube)
        anchor?.addChild(secondRowFifthCulmnFifthStrataCube)
        
        // 3
        anchor?.addChild(thirdRowFirstCulmnFirstStrataCube)
        anchor?.addChild(thirdRowFirstCulmnSecondStrataCube)
        anchor?.addChild(thirdRowFirstCulmnThirdStrataCube)
        anchor?.addChild(thirdRowFirstCulmnFourthStrataCube)
        anchor?.addChild(thirdRowFirstCulmnFifthStrataCube)
        
        anchor?.addChild(thirdRowSecondCulmnFirstStrataCube)
        anchor?.addChild(thirdRowSecondCulmnSecondStrataCube)
        anchor?.addChild(thirdRowSecondCulmnThirdStrataCube)
        anchor?.addChild(thirdRowSecondCulmnFourthStrataCube)
        anchor?.addChild(thirdRowSecondCulmnFifthStrataCube)
        
        anchor?.addChild(thirdRowThirdCulmnFirstStrataCube)
        anchor?.addChild(thirdRowThirdCulmnSecondStrataCube)
        anchor?.addChild(thirdRowThirdCulmnThirdStrataCube)
        anchor?.addChild(thirdRowThirdCulmnFourthStrataCube)
        anchor?.addChild(thirdRowThirdCulmnFifthStrataCube)
        
        anchor?.addChild(thirdRowFourthCulmnFirstStrataCube)
        anchor?.addChild(thirdRowFourthCulmnSecondStrataCube)
        anchor?.addChild(thirdRowFourthCulmnThirdStrataCube)
        anchor?.addChild(thirdRowFourthCulmnFourthStrataCube)
        anchor?.addChild(thirdRowFourthCulmnFifthStrataCube)
        
        anchor?.addChild(thirdRowFifthCulmnFirstStrataCube)
        anchor?.addChild(thirdRowFifthCulmnSecondStrataCube)
        anchor?.addChild(thirdRowFifthCulmnThirdStrataCube)
        anchor?.addChild(thirdRowFifthCulmnFourthStrataCube)
        anchor?.addChild(thirdRowFifthCulmnFifthStrataCube)
        
        // 4
        anchor?.addChild(fourthRowFirstCulmnFirstStrataCube)
        anchor?.addChild(fourthRowFirstCulmnSecondStrataCube)
        anchor?.addChild(fourthRowFirstCulmnThirdStrataCube)
        anchor?.addChild(fourthRowFirstCulmnFourthStrataCube)
        anchor?.addChild(fourthRowFirstCulmnFifthStrataCube)
        
        anchor?.addChild(fourthRowSecondCulmnFirstStrataCube)
        anchor?.addChild(fourthRowSecondCulmnSecondStrataCube)
        anchor?.addChild(fourthRowSecondCulmnThirdStrataCube)
        anchor?.addChild(fourthRowSecondCulmnFourthStrataCube)
        anchor?.addChild(fourthRowSecondCulmnFifthStrataCube)
        
        anchor?.addChild(fourthRowThirdCulmnFirstStrataCube)
        anchor?.addChild(fourthRowThirdCulmnSecondStrataCube)
        anchor?.addChild(fourthRowThirdCulmnThirdStrataCube)
        anchor?.addChild(fourthRowThirdCulmnFourthStrataCube)
        anchor?.addChild(fourthRowThirdCulmnFifthStrataCube)
        
        anchor?.addChild(fourthRowFourthCulmnFirstStrataCube)
        anchor?.addChild(fourthRowFourthCulmnSecondStrataCube)
        anchor?.addChild(fourthRowFourthCulmnThirdStrataCube)
        anchor?.addChild(fourthRowFourthCulmnFourthStrataCube)
        anchor?.addChild(fourthRowFourthCulmnFifthStrataCube)

        anchor?.addChild(fourthRowFifthCulmnFirstStrataCube)
        anchor?.addChild(fourthRowFifthCulmnSecondStrataCube)
        anchor?.addChild(fourthRowFifthCulmnThirdStrataCube)
        anchor?.addChild(fourthRowFifthCulmnFourthStrataCube)
        anchor?.addChild(fourthRowFifthCulmnFifthStrataCube)

        // 5
        anchor?.addChild(fifthRowFirstCulmnFirstStrataCube)
        anchor?.addChild(fifthRowFirstCulmnSecondStrataCube)
        anchor?.addChild(fifthRowFirstCulmnThirdStrataCube)
        anchor?.addChild(fifthRowFirstCulmnFourthStrataCube)
        anchor?.addChild(fifthRowFirstCulmnFifthStrataCube)
        
        anchor?.addChild(fifthRowSecondCulmnFirstStrataCube)
        anchor?.addChild(fifthRowSecondCulmnSecondStrataCube)
        anchor?.addChild(fifthRowSecondCulmnThirdStrataCube)
        anchor?.addChild(fifthRowSecondCulmnFourthStrataCube)
        anchor?.addChild(fifthRowSecondCulmnFifthStrataCube)
        
        anchor?.addChild(fifthRowThirdCulmnFirstStrataCube)
        anchor?.addChild(fifthRowThirdCulmnSecondStrataCube)
        anchor?.addChild(fifthRowThirdCulmnThirdStrataCube)
        anchor?.addChild(fifthRowThirdCulmnFourthStrataCube)
        anchor?.addChild(fifthRowThirdCulmnFifthStrataCube)
        
        anchor?.addChild(fifthRowFourthCulmnFirstStrataCube)
        anchor?.addChild(fifthRowFourthCulmnSecondStrataCube)
        anchor?.addChild(fifthRowFourthCulmnThirdStrataCube)
        anchor?.addChild(fifthRowFourthCulmnFourthStrataCube)
        anchor?.addChild(fifthRowFourthCulmnFifthStrataCube)
        
        anchor?.addChild(fifthRowFifthCulmnFirstStrataCube)
        anchor?.addChild(fifthRowFifthCulmnSecondStrataCube)
        anchor?.addChild(fifthRowFifthCulmnThirdStrataCube)
        anchor?.addChild(fifthRowFifthCulmnFourthStrataCube)
        anchor?.addChild(fifthRowFifthCulmnFifthStrataCube)
        
               // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
    }
    
    
    func makeAnchor() {
        // AnchorEntity生成
        let anchor2 = AnchorEntity()
        // カメラ座標
        let transform = arView.cameraTransform.translation
        let infrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 0.3)
        
        let goalInfrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 2.0)
        // カメラ座標　→ ワールド座標
        let cubePositon = anchor2.convert(position: goalInfrontOfCamera, to: worldAnchor)
        
        let movePosition = float4x4.init(translation: cubePositon)
        
//        anchor?.position = simd_make_float3(0, -0.5, -1.5)
//        anchor?.position = cubePositon!
        
        anchor2.position = infrontOfCamera
        
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.09, 0.09, 0.09])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        let cube = ModelEntity(mesh: mesh, materials: [material])
        
        anchor2.addChild(cube)
        // 追加
        arView.scene.addAnchor(anchor2)
        
        
        // 発射処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let anime = cube.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
    }
    
    @IBAction func tappedMakeButton(_ sender: Any) {
        makeAnchor()
    }
    
    

    @IBAction func selectedNumber(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.makeACube()
        case 1:
            self.makeFourCubes()
        case 2:
            self.makeNineCubes()
        case 3:
            self.makeSixteenCubes()
        case 4:
            self.makeTwentyFiveCubes()
        default:
            return
        
        }
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
