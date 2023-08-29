//
//  HomeViewController.swift
//  ARCubeShooter
//
//  Created by Oh!ara on 2023/08/17.
//

import UIKit
import RealityKit
import ARKit
import Combine

class HomeViewController: UIViewController {
    
    // MARK: - UI
    
    @IBOutlet weak var arView: ARView!
    
    @IBOutlet weak var numberOfCubesSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var makeButton: UIButton!
    
    // MARK: - 変数
   
    var anchor: AnchorEntity?
//    var cubeModel: ModelEntity?
    var worldAnchor: AnchorEntity?
//    var cubeModels: [ModelEntity] = []
    var shieldAnchor: AnchorEntity?
    
    
    // cubeEntity
    // 1Strata
    // 1Row
    var firstRowFirstCulmnFirstStrataCube: ModelEntity?
    var firstRowSecondCulmnFirstStrataCube: ModelEntity?
    var firstRowThirdCulmnFirstStrataCube: ModelEntity?
    var firstRowFourthCulmnFirstStrataCube: ModelEntity?
    var firstRowFifthCulmnFirstStrataCube: ModelEntity?
    // 2Row
    var secondRowFirstCulmnFirstStrataCube: ModelEntity?
    var secondRowSecondCulmnFirstStrataCube: ModelEntity?
    var secondRowThirdCulmnFirstStrataCube: ModelEntity?
    var secondRowFourthCulmnFirstStrataCube: ModelEntity?
    var secondRowFifthCulmnFirstStrataCube: ModelEntity?
    // 3Row
    var thirdRowFirstCulmnFirstStrataCube: ModelEntity?
    var thirdRowSecondCulmnFirstStrataCube: ModelEntity?
    var thirdRowThirdCulmnFirstStrataCube: ModelEntity?
    var thirdRowFourthCulmnFirstStrataCube: ModelEntity?
    var thirdRowFifthCulmnFirstStrataCube: ModelEntity?
    // 4Row
    var fourthRowFirstCulmnFirstStrataCube: ModelEntity?
    var fourthRowSecondCulmnFirstStrataCube: ModelEntity?
    var fourthRowThirdCulmnFirstStrataCube: ModelEntity?
    var fourthRowFourthCulmnFirstStrataCube: ModelEntity?
    var fourthRowFifthCulmnFirstStrataCube: ModelEntity?
    // 5Row
    var fifthRowFirstCulmnFirstStrataCube: ModelEntity?
    var fifthRowSecondCulmnFirstStrataCube: ModelEntity?
    var fifthRowThirdCulmnFirstStrataCube: ModelEntity?
    var fifthRowFourthCulmnFirstStrataCube: ModelEntity?
    var fifthRowFifthCulmnFirstStrataCube: ModelEntity?

    
    // 2Strata
    // 1Row
    var firstRowFirstCulmnSecondStrataCube: ModelEntity?
    var firstRowSecondCulmnSecondStrataCube: ModelEntity?
    var firstRowThirdCulmnSecondStrataCube: ModelEntity?
    var firstRowFourthCulmnSecondStrataCube: ModelEntity?
    var firstRowFifthCulmnSecondStrataCube: ModelEntity?
    // 2Row
    var secondRowFirstCulmnSecondStrataCube: ModelEntity?
    var secondRowSecondCulmnSecondStrataCube: ModelEntity?
    var secondRowThirdCulmnSecondStrataCube: ModelEntity?
    var secondRowFourthCulmnSecondStrataCube: ModelEntity?
    var secondRowFifthCulmnSecondStrataCube: ModelEntity?
    // 3Row
    var thirdRowFirstCulmnSecondStrataCube: ModelEntity?
    var thirdRowSecondCulmnSecondStrataCube: ModelEntity?
    var thirdRowThirdCulmnSecondStrataCube: ModelEntity?
    var thirdRowFourthCulmnSecondStrataCube: ModelEntity?
    var thirdRowFifthCulmnSecondStrataCube: ModelEntity?
    // 4Row
    var fourthRowFirstCulmnSecondStrataCube: ModelEntity?
    var fourthRowSecondCulmnSecondStrataCube: ModelEntity?
    var fourthRowThirdCulmnSecondStrataCube: ModelEntity?
    var fourthRowFourthCulmnSecondStrataCube: ModelEntity?
    var fourthRowFifthCulmnSecondStrataCube: ModelEntity?
    // 5Row
    var fifthRowFirstCulmnSecondStrataCube: ModelEntity?
    var fifthRowSecondCulmnSecondStrataCube: ModelEntity?
    var fifthRowThirdCulmnSecondStrataCube: ModelEntity?
    var fifthRowFourthCulmnSecondStrataCube: ModelEntity?
    var fifthRowFifthCulmnSecondStrataCube: ModelEntity?

    
    
    // 3Strata
    // 1Row
    var firstRowFirstCulmnThirdStrataCube: ModelEntity?
    var firstRowSecondCulmnThirdStrataCube: ModelEntity?
    var firstRowThirdCulmnThirdStrataCube: ModelEntity?
    var firstRowFourthCulmnThirdStrataCube: ModelEntity?
    var firstRowFifthCulmnThirdStrataCube: ModelEntity?
    // 2Row
    var secondRowFirstCulmnThirdStrataCube: ModelEntity?
    var secondRowSecondCulmnThirdStrataCube: ModelEntity?
    var secondRowThirdCulmnThirdStrataCube: ModelEntity?
    var secondRowFourthCulmnThirdStrataCube: ModelEntity?
    var secondRowFifthCulmnThirdStrataCube: ModelEntity?
    // 3Row
    var thirdRowFirstCulmnThirdStrataCube: ModelEntity?
    var thirdRowSecondCulmnThirdStrataCube: ModelEntity?
    var thirdRowThirdCulmnThirdStrataCube: ModelEntity?
    var thirdRowFourthCulmnThirdStrataCube: ModelEntity?
    var thirdRowFifthCulmnThirdStrataCube: ModelEntity?
    // 4Row
    var fourthRowFirstCulmnThirdStrataCube: ModelEntity?
    var fourthRowSecondCulmnThirdStrataCube: ModelEntity?
    var fourthRowThirdCulmnThirdStrataCube: ModelEntity?
    var fourthRowFourthCulmnThirdStrataCube: ModelEntity?
    var fourthRowFifthCulmnThirdStrataCube: ModelEntity?
    // 5Row
    var fifthRowFirstCulmnThirdStrataCube: ModelEntity?
    var fifthRowSecondCulmnThirdStrataCube: ModelEntity?
    var fifthRowThirdCulmnThirdStrataCube: ModelEntity?
    var fifthRowFourthCulmnThirdStrataCube: ModelEntity?
    var fifthRowFifthCulmnThirdStrataCube: ModelEntity?

    
    
    // 4Strata
    // 1Row
    var firstRowFirstCulmnFourthStrataCube: ModelEntity?
    var firstRowSecondCulmnFourthStrataCube: ModelEntity?
    var firstRowThirdCulmnFourthStrataCube: ModelEntity?
    var firstRowFourthCulmnFourthStrataCube: ModelEntity?
    var firstRowFifthCulmnFourthStrataCube: ModelEntity?
    // 2Row
    var secondRowFirstCulmnFourthStrataCube: ModelEntity?
    var secondRowSecondCulmnFourthStrataCube: ModelEntity?
    var secondRowThirdCulmnFourthStrataCube: ModelEntity?
    var secondRowFourthCulmnFourthStrataCube: ModelEntity?
    var secondRowFifthCulmnFourthStrataCube: ModelEntity?
    // 3Row
    var thirdRowFirstCulmnFourthStrataCube: ModelEntity?
    var thirdRowSecondCulmnFourthStrataCube: ModelEntity?
    var thirdRowThirdCulmnFourthStrataCube: ModelEntity?
    var thirdRowFourthCulmnFourthStrataCube: ModelEntity?
    var thirdRowFifthCulmnFourthStrataCube: ModelEntity?
    // 4Row
    var fourthRowFirstCulmnFourthStrataCube: ModelEntity?
    var fourthRowSecondCulmnFourthStrataCube: ModelEntity?
    var fourthRowThirdCulmnFourthStrataCube: ModelEntity?
    var fourthRowFourthCulmnFourthStrataCube: ModelEntity?
    var fourthRowFifthCulmnFourthStrataCube: ModelEntity?
    // 5Row
    var fifthRowFirstCulmnFourthStrataCube: ModelEntity?
    var fifthRowSecondCulmnFourthStrataCube: ModelEntity?
    var fifthRowThirdCulmnFourthStrataCube: ModelEntity?
    var fifthRowFourthCulmnFourthStrataCube: ModelEntity?
    var fifthRowFifthCulmnFourthStrataCube: ModelEntity?

    // 5Strata
    // 1Row
    var firstRowFirstCulmnFifthStrataCube: ModelEntity?
    var firstRowSecondCulmnFifthStrataCube: ModelEntity?
    var firstRowThirdCulmnFifthStrataCube: ModelEntity?
    var firstRowFourthCulmnFifthStrataCube: ModelEntity?
    var firstRowFifthCulmnFifthStrataCube: ModelEntity?
    // 2Row
    var secondRowFirstCulmnFifthStrataCube: ModelEntity?
    var secondRowSecondCulmnFifthStrataCube: ModelEntity?
    var secondRowThirdCulmnFifthStrataCube: ModelEntity?
    var secondRowFourthCulmnFifthStrataCube: ModelEntity?
    var secondRowFifthCulmnFifthStrataCube: ModelEntity?
    // 3Row
    var thirdRowFirstCulmnFifthStrataCube: ModelEntity?
    var thirdRowSecondCulmnFifthStrataCube: ModelEntity?
    var thirdRowThirdCulmnFifthStrataCube: ModelEntity?
    var thirdRowFourthCulmnFifthStrataCube: ModelEntity?
    var thirdRowFifthCulmnFifthStrataCube: ModelEntity?
    // 4Row
    var fourthRowFirstCulmnFifthStrataCube: ModelEntity?
    var fourthRowSecondCulmnFifthStrataCube: ModelEntity?
    var fourthRowThirdCulmnFifthStrataCube: ModelEntity?
    var fourthRowFourthCulmnFifthStrataCube: ModelEntity?
    var fourthRowFifthCulmnFifthStrataCube: ModelEntity?
    // 5Row
    var fifthRowFirstCulmnFifthStrataCube: ModelEntity?
    var fifthRowSecondCulmnFifthStrataCube: ModelEntity?
    var fifthRowThirdCulmnFifthStrataCube: ModelEntity?
    var fifthRowFourthCulmnFifthStrataCube: ModelEntity?
    var fifthRowFifthCulmnFifthStrataCube: ModelEntity?
    
    var shieldModel: ModelEntity?
    
    var life: Int = 100
    var speed: Int = 0
    var point: Int = 0
    
    var collisionBegan: Cancellable?
    
    let cubeName: String = "cube"
    let shieldName: String = "shield"
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAR()
        
        setupModelEntity()
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
        
        // コリジョンの設定
        collisionBegan = arView.scene.subscribe(to: CollisionEvents.Began.self, onCollisionBegan(_:))
    

    }
    
    func setupModelEntity() {
        
        
        // cubeEntity
        // 1Strata
        // 1Row
        firstRowFirstCulmnFirstStrataCube?.name = "cube"
        firstRowSecondCulmnFirstStrataCube?.name = "cube"
        firstRowThirdCulmnFirstStrataCube?.name = "cube"
        firstRowFourthCulmnFirstStrataCube?.name = "cube"
        firstRowFifthCulmnFirstStrataCube?.name = "cube"
        // 2Row
        secondRowFirstCulmnFirstStrataCube?.name = "cube"
        secondRowSecondCulmnFirstStrataCube?.name = "cube"
        secondRowThirdCulmnFirstStrataCube?.name = "cube"
        secondRowFourthCulmnFirstStrataCube?.name = "cube"
        secondRowFifthCulmnFirstStrataCube?.name = "cube"
        // 3Row
        thirdRowFirstCulmnFirstStrataCube?.name = "cube"
        thirdRowSecondCulmnFirstStrataCube?.name = "cube"
        thirdRowThirdCulmnFirstStrataCube?.name = "cube"
        thirdRowFourthCulmnFirstStrataCube?.name = "cube"
        thirdRowFifthCulmnFirstStrataCube?.name = "cube"
        // 4Row
        fourthRowFirstCulmnFirstStrataCube?.name = "cube"
        fourthRowSecondCulmnFirstStrataCube?.name = "cube"
        fourthRowThirdCulmnFirstStrataCube?.name = "cube"
        fourthRowFourthCulmnFirstStrataCube?.name = "cube"
        fourthRowFifthCulmnFirstStrataCube?.name = "cube"
        // 5Row
        fifthRowFirstCulmnFirstStrataCube?.name = "cube"
        fifthRowSecondCulmnFirstStrataCube?.name = "cube"
        fifthRowThirdCulmnFirstStrataCube?.name = "cube"
        fifthRowFourthCulmnFirstStrataCube?.name = "cube"
        fifthRowFifthCulmnFirstStrataCube?.name = "cube"

        
        // 2Strata
        // 1Row
        firstRowFirstCulmnSecondStrataCube?.name = "cube"
        firstRowSecondCulmnSecondStrataCube?.name = "cube"
        firstRowThirdCulmnSecondStrataCube?.name = "cube"
        firstRowFourthCulmnSecondStrataCube?.name = "cube"
        firstRowFifthCulmnSecondStrataCube?.name = "cube"
        // 2Row
        secondRowFirstCulmnSecondStrataCube?.name = "cube"
        secondRowSecondCulmnSecondStrataCube?.name = "cube"
        secondRowThirdCulmnSecondStrataCube?.name = "cube"
        secondRowFourthCulmnSecondStrataCube?.name = "cube"
        secondRowFifthCulmnSecondStrataCube?.name = "cube"
        // 3Row
        thirdRowFirstCulmnSecondStrataCube?.name = "cube"
        thirdRowSecondCulmnSecondStrataCube?.name = "cube"
        thirdRowThirdCulmnSecondStrataCube?.name = "cube"
        thirdRowFourthCulmnSecondStrataCube?.name = "cube"
        thirdRowFifthCulmnSecondStrataCube?.name = "cube"
        // 4Row
        fourthRowFirstCulmnSecondStrataCube?.name = "cube"
        fourthRowSecondCulmnSecondStrataCube?.name = "cube"
        fourthRowThirdCulmnSecondStrataCube?.name = "cube"
        fourthRowFourthCulmnSecondStrataCube?.name = "cube"
        fourthRowFifthCulmnSecondStrataCube?.name = "cube"
        // 5Row
        fifthRowFirstCulmnSecondStrataCube?.name = "cube"
        fifthRowSecondCulmnSecondStrataCube?.name = "cube"
        fifthRowThirdCulmnSecondStrataCube?.name = "cube"
        fifthRowFourthCulmnSecondStrataCube?.name = "cube"
        fifthRowFifthCulmnSecondStrataCube?.name = "cube"

        
        
        // 3Strata
        // 1Row
        firstRowFirstCulmnThirdStrataCube?.name = "cube"
        firstRowSecondCulmnThirdStrataCube?.name = "cube"
        firstRowThirdCulmnThirdStrataCube?.name = "cube"
        firstRowFourthCulmnThirdStrataCube?.name = "cube"
        firstRowFifthCulmnThirdStrataCube?.name = "cube"
        // 2Row
        secondRowFirstCulmnThirdStrataCube?.name = "cube"
        secondRowSecondCulmnThirdStrataCube?.name = "cube"
        secondRowThirdCulmnThirdStrataCube?.name = "cube"
        secondRowFourthCulmnThirdStrataCube?.name = "cube"
        secondRowFifthCulmnThirdStrataCube?.name = "cube"
        // 3Row
        thirdRowFirstCulmnThirdStrataCube?.name = "cube"
        thirdRowSecondCulmnThirdStrataCube?.name = "cube"
        thirdRowThirdCulmnThirdStrataCube?.name = "cube"
        thirdRowFourthCulmnThirdStrataCube?.name = "cube"
        thirdRowFifthCulmnThirdStrataCube?.name = "cube"
        // 4Row
        fourthRowFirstCulmnThirdStrataCube?.name = "cube"
        fourthRowSecondCulmnThirdStrataCube?.name = "cube"
        fourthRowThirdCulmnThirdStrataCube?.name = "cube"
        fourthRowFourthCulmnThirdStrataCube?.name = "cube"
        fourthRowFifthCulmnThirdStrataCube?.name = "cube"
        // 5Row
        fifthRowFirstCulmnThirdStrataCube?.name = "cube"
        fifthRowSecondCulmnThirdStrataCube?.name = "cube"
        fifthRowThirdCulmnThirdStrataCube?.name = "cube"
        fifthRowFourthCulmnThirdStrataCube?.name = "cube"
        fifthRowFifthCulmnThirdStrataCube?.name = "cube"

        
        
        // 4Strata
        // 1Row
        firstRowFirstCulmnFourthStrataCube?.name = "cube"
        firstRowSecondCulmnFourthStrataCube?.name = "cube"
        firstRowThirdCulmnFourthStrataCube?.name = "cube"
        firstRowFourthCulmnFourthStrataCube?.name = "cube"
        firstRowFifthCulmnFourthStrataCube?.name = "cube"
        // 2Row
        secondRowFirstCulmnFourthStrataCube?.name = "cube"
        secondRowSecondCulmnFourthStrataCube?.name = "cube"
        secondRowThirdCulmnFourthStrataCube?.name = "cube"
        secondRowFourthCulmnFourthStrataCube?.name = "cube"
        secondRowFifthCulmnFourthStrataCube?.name = "cube"
        // 3Row
        thirdRowFirstCulmnFourthStrataCube?.name = "cube"
        thirdRowSecondCulmnFourthStrataCube?.name = "cube"
        thirdRowThirdCulmnFourthStrataCube?.name = "cube"
        thirdRowFourthCulmnFourthStrataCube?.name = "cube"
        thirdRowFifthCulmnFourthStrataCube?.name = "cube"
        // 4Row
        fourthRowFirstCulmnFourthStrataCube?.name = "cube"
        fourthRowSecondCulmnFourthStrataCube?.name = "cube"
        fourthRowThirdCulmnFourthStrataCube?.name = "cube"
        fourthRowFourthCulmnFourthStrataCube?.name = "cube"
        fourthRowFifthCulmnFourthStrataCube?.name = "cube"
        // 5Row
        fifthRowFirstCulmnFourthStrataCube?.name = "cube"
        fifthRowSecondCulmnFourthStrataCube?.name = "cube"
        fifthRowThirdCulmnFourthStrataCube?.name = "cube"
        fifthRowFourthCulmnFourthStrataCube?.name = "cube"
        fifthRowFifthCulmnFourthStrataCube?.name = "cube"

        // 5Strata
        // 1Row
        firstRowFirstCulmnFifthStrataCube?.name = "cube"
        firstRowSecondCulmnFifthStrataCube?.name = "cube"
        firstRowThirdCulmnFifthStrataCube?.name = "cube"
        firstRowFourthCulmnFifthStrataCube?.name = "cube"
        firstRowFifthCulmnFifthStrataCube?.name = "cube"
        // 2Row
        secondRowFirstCulmnFifthStrataCube?.name = "cube"
        secondRowSecondCulmnFifthStrataCube?.name = "cube"
        secondRowThirdCulmnFifthStrataCube?.name = "cube"
        secondRowFourthCulmnFifthStrataCube?.name = "cube"
        secondRowFifthCulmnFifthStrataCube?.name = "cube"
        // 3Row
        thirdRowFirstCulmnFifthStrataCube?.name = "cube"
        thirdRowSecondCulmnFifthStrataCube?.name = "cube"
        thirdRowThirdCulmnFifthStrataCube?.name = "cube"
        thirdRowFourthCulmnFifthStrataCube?.name = "cube"
        thirdRowFifthCulmnFifthStrataCube?.name = "cube"
        // 4Row
        fourthRowFirstCulmnFifthStrataCube?.name = "cube"
        fourthRowSecondCulmnFifthStrataCube?.name = "cube"
        fourthRowThirdCulmnFifthStrataCube?.name = "cube"
        fourthRowFourthCulmnFifthStrataCube?.name = "cube"
        fourthRowFifthCulmnFifthStrataCube?.name = "cube"
        // 5Row
        fifthRowFirstCulmnFifthStrataCube?.name = "cube"
        fifthRowSecondCulmnFifthStrataCube?.name = "cube"
        fifthRowThirdCulmnFifthStrataCube?.name = "cube"
        fifthRowFourthCulmnFifthStrataCube?.name = "cube"
        fifthRowFifthCulmnFifthStrataCube?.name = "cube"
        
        shieldModel?.name = "shield"
        
    }
    
 
//    func makeCube() {
//
//        // AnchorEntity生成
//        anchor = AnchorEntity()
//        anchor?.position = simd_make_float3(0, -0.5, -1.5)
//
//        // cube実装
//        let mesh = MeshResource.generateBox(size: [0.9, 0.9, 0.9])
//        let material = SimpleMaterial(color: .cyan, isMetallic: false)
//        let cube = ModelEntity(mesh: mesh, materials: [material])
//
//        anchor?.addChild(cube)
//        // 追加
//        arView.scene.addAnchor(anchor!)
//
//    }
    
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
        
        
        anchor?.position = infrontOfCamera
        
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.09, 0.09, 0.09])
        let material = SimpleMaterial(color: .cyan, isMetallic: false)
        firstRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFifthStrataCube?.name = "cube"
        firstRowFifthCulmnFifthStrataCube.durableValue = 1
        
        anchor?.addChild(firstRowFifthCulmnFifthStrataCube!)
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
    
        
        // 1
        
        firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        
        firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        
        
        firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
        firstRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
     
        // 2
        secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube?.position =  simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        
        secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        
        secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        
       secondRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        

        
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(firstRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube!)
        
        anchor?.addChild(firstRowFourthCulmnFirstStrataCube!)
         
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFourthCulmnFirstStrataCube!)
      
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
        
        firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        firstRowFirstCulmnFirstStrataCube?.durableValue = 1
        
        secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), (anchor?.position.z)!)
        secondRowFirstCulmnFirstStrataCube?.durableValue = 1
        
        thirdRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        thirdRowFirstCulmnFirstStrataCube?.durableValue = 1
        
        firstRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, (anchor?.position.z)!)
        firstRowSecondCulmnFirstStrataCube?.durableValue = 1
        
        secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube?.position = anchor!.position
        secondRowSecondCulmnFirstStrataCube?.durableValue = 1
        
        thirdRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, (anchor?.position.z)!)
        thirdRowSecondCulmnFirstStrataCube?.durableValue = 1
        
        firstRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        firstRowThirdCulmnFirstStrataCube?.durableValue = 1
        
        secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), (anchor?.position.z)!)
        secondRowThirdCulmnFirstStrataCube?.durableValue = 1
        
        thirdRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        thirdRowThirdCulmnFirstStrataCube?.durableValue = 1
        
        // 2
        firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        firstRowFirstCulmnSecondStrataCube?.durableValue = 1
        
        secondRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        secondRowFirstCulmnSecondStrataCube?.durableValue = 1
        
        thirdRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        thirdRowFirstCulmnSecondStrataCube?.durableValue = 1
        
        firstRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        firstRowSecondCulmnSecondStrataCube?.durableValue = 1
        
        secondRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length))
        secondRowSecondCulmnSecondStrataCube?.durableValue = 1
        
        thirdRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        thirdRowSecondCulmnSecondStrataCube?.durableValue = 1
        
        firstRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        firstRowThirdCulmnSecondStrataCube?.durableValue = 1
        
        secondRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        secondRowThirdCulmnSecondStrataCube?.durableValue = 1
        
        thirdRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        thirdRowThirdCulmnSecondStrataCube?.durableValue = 1
        
        // 3
        firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube!.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        firstRowFirstCulmnThirdStrataCube?.durableValue = 1
        
        secondRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        firstRowFirstCulmnFirstStrataCube?.durableValue = 1
        
        thirdRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        thirdRowFirstCulmnThirdStrataCube?.durableValue = 1
        
        firstRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        firstRowSecondCulmnThirdStrataCube?.durableValue = 1
        
        secondRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length))
        secondRowSecondCulmnThirdStrataCube?.durableValue = 1
        
        thirdRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        thirdRowSecondCulmnThirdStrataCube?.durableValue = 1
        
        firstRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        firstRowThirdCulmnThirdStrataCube?.durableValue = 1
        
        secondRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        secondRowThirdCulmnThirdStrataCube?.durableValue = 1
        
        thirdRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        thirdRowThirdCulmnThirdStrataCube?.durableValue = 1
        
     
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(firstRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnFirstStrataCube!)
        
        anchor?.addChild(firstRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(firstRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(secondRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(firstRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(secondRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnSecondStrataCube!)
        
        anchor?.addChild(firstRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnThirdStrataCube!)
        
        anchor?.addChild(firstRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(secondRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnThirdStrataCube!)
        
        anchor?.addChild(firstRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(secondRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnThirdStrataCube!)
        
        // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
//        }
        
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
        
        // 1Strata
        // 1-1-1
        firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 3-1-1
        thirdRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 4-1-1
        fourthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
       
        // 1-2-1
        firstRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 2-2-1
        secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 3-2-1
        thirdRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 4-2-1
        fourthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2 * 3))
       
        // 1-3-1
        firstRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 2-3-1
        secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 3-3-1
        thirdRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        // 4-3-1
        fourthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2 * 3))
        
        // 1-4-1
        firstRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! + length / 2 * 3))
        // 2-4-1
        secondRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 3-4-1
        thirdRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        // 4-4-1
        fourthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2 * 3))
        
        // 2Strata
        // 1-1-2
        firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 2-1-2
        secondRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 3-1-2
        thirdRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 4-1-2
        fourthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! + length / 2))
        
        // 1-2-2
        firstRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 2-2-2
        secondRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 3-2-2
        thirdRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        // 4-2-2
        fourthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! + length / 2))
        
        // 1-3-2
        firstRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 2-3-2
        secondRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 3-3-2
        thirdRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! + length / 2))
        // 4-3-2
        fourthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
        // 1-4-2
        firstRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! + length / 2))
        // 2-4-2
        secondRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 3-4-2
        thirdRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        // 4-4-2
        fourthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! + length / 2))
        
        // 3Strata
        // 1-1-3
        firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 2-1-3
        secondRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 3-1-3
        thirdRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 4-1-3
        fourthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2))
        
        // 1-2-3
        firstRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 2-2-3
        secondRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 3-2-3
        thirdRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        // 4-2-3
        fourthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2))
        
        // 1-3-3
        firstRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 2-3-3
        secondRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 3-3-3
        thirdRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        // 4-3-3
        fourthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2))
        
        // 1-4-3
        firstRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! - length / 2))
        // 2-4-3
        secondRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 3-4-3
        thirdRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        // 4-4-3
        fourthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2))
        
        // 4Strata
        // 1-1-4
        firstRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
        // 2-1-4
        secondRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
        // 3-1-4
        thirdRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
        // 4-1-4
        fourthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 1-2-4
        firstRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 2-2-4
        secondRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 3-2-4
        thirdRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 4-2-4
        fourthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! + length / 2), ((anchor?.position.z)! - length / 2 * 3))
       
        
        // 1-3-4
        firstRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 2-3-4
        secondRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 3-3-4
        thirdRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
        // 4-3-4
        fourthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2 * 3), ((anchor?.position.y)! - length / 2), ((anchor?.position.z)! - length / 2 * 3))
        
        // 1-4-4
        firstRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3),  ((anchor?.position.z)! - length / 2 * 3))
        // 2-4-4
        secondRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
    
        // 3-4-4
        thirdRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length / 2), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
   
        // 4-4-4
        fourthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! +  length / 2 * 3), ((anchor?.position.y)! - length / 2 * 3), ((anchor?.position.z)! - length / 2 * 3))
        
               
        
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(firstRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(firstRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(firstRowFirstCulmnFourthStrataCube!)
        
        anchor?.addChild(firstRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(firstRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(firstRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(firstRowSecondCulmnFourthStrataCube!)
        
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(firstRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(firstRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(firstRowThirdCulmnFourthStrataCube!)
        
        anchor?.addChild(firstRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(firstRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(firstRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(firstRowFourthCulmnFourthStrataCube!)
        
        // 2
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFirstCulmnFourthStrataCube!)
        
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(secondRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(secondRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(secondRowSecondCulmnFourthStrataCube!)
        
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(secondRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(secondRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(secondRowThirdCulmnFourthStrataCube!)
        
        anchor?.addChild(secondRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFourthCulmnFourthStrataCube!)
        
        // 3
        anchor?.addChild(thirdRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnFourthStrataCube!)
        
        anchor?.addChild(thirdRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnFourthStrataCube!)
        
        anchor?.addChild(thirdRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnFourthStrataCube!)
        
        anchor?.addChild(thirdRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnFourthStrataCube!)
        
        // 4
        anchor?.addChild(fourthRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnFourthStrataCube!)
        
        anchor?.addChild(fourthRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnFourthStrataCube!)
        
        anchor?.addChild(fourthRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnFourthStrataCube!)
        
        anchor?.addChild(fourthRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnFourthStrataCube!)
        
        
        
        
      
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
        
        // 1Strata
        // 1-1-1
        firstRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 2-1-1
        secondRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 3-1-1
        thirdRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 4-1-1
        fourthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        // 5-1-1
        fifthRowFirstCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length * 2))
        
        // 1-2-1
        firstRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! + length * 2))
        // 2-2-1
        secondRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 3-2-1
        thirdRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 4-2-1
        fourthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        // 5-2-1
        fifthRowSecondCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length * 2))
        
        // 1-3-1
        firstRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 2-3-1
        secondRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 3-3-1
        thirdRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 4-3-1
        fourthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        // 5-3-1
        fifthRowThirdCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length * 2))
        
        // 1-4-1
        firstRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 2-4-1
        secondRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 3-4-1
        thirdRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 4-4-1
        fourthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 5-4-1
        fifthRowFourthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        
        // 1-5-1
        firstRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 2-5-1
        secondRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 3-5-1
        thirdRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFirstStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 4-5-1
        fourthRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        // 5-5-1
        fifthRowFifthCulmnFirstStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFirstStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length * 2))
        
        // 2Strata
        // 1-1-2
        firstRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! + length))
        // 2-1-2
        secondRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 3-1-2
        thirdRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 4-1-2
        fourthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        // 5-1-2
        fifthRowFirstCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! + length))
        
        // 1-2-2
        firstRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! + length))
        // 2-2-2
        secondRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 3-2-2
        thirdRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 4-2-2
        fourthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 5-2-2
        fifthRowSecondCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        
        // 1-3-2
        firstRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 2-3-2
        secondRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        // 3-3-2
        thirdRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 4-3-2
        fourthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        // 5-3-2
        fifthRowThirdCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        
        // 1-4-2
        firstRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 2-4-2
        secondRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 3-4-2
        thirdRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length * 2))
        // 4-4-2
        fourthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        // 5-4-2
        fifthRowFourthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        
        // 1-5-2
        firstRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 2-5-2
        secondRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 3-5-2
        thirdRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnSecondStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 4-5-2
        fourthRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        // 5-5-2
        fifthRowFifthCulmnSecondStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnSecondStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! + length))
        
        // 3Strata
        // 1-1-3
        firstRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), (anchor?.position.z)!)
        // 2-1-3
        secondRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 3-1-3
        thirdRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 4-1-3
        fourthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        // 5-1-3
        fifthRowFirstCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), (anchor?.position.z)!)
        
        // 1-2-3
        firstRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 2-2-3
        secondRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 3-2-3
        thirdRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 4-2-3
        fourthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        // 5-2-3
        fifthRowSecondCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        
        // 1-3-3
        firstRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, (anchor?.position.z)!)
        // 2-3-3
        secondRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, (anchor?.position.z)!)
        // 3-3-3
        thirdRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, (anchor?.position.z)!)
        // 4-3-3
        fourthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, (anchor?.position.z)!)
        // 5-3-3
        fifthRowThirdCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, (anchor?.position.z)!)
        
        
        
        // 1-4-3
        firstRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 2-4-3
        secondRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 3-4-3
        thirdRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 4-4-3
        fourthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        // 5-4-3
        fifthRowFourthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        
        // 1-5-3
        firstRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 2-5-3
        secondRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 3-5-3
        thirdRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnThirdStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 4-5-3
        fourthRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        // 5-5-3
        fifthRowFifthCulmnThirdStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnThirdStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), (anchor?.position.z)!)
        
        // 4Strata
        // 1-1-4
        firstRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! - length))
        // 2-1-4
        secondRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 3-1-4
        thirdRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFourthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 4-1-4
        fourthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        // 5-1-4
        fifthRowFirstCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length))
        
        // 1-2-4
        firstRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! - length))
        // 2-2-4
        secondRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 3-2-4
        thirdRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFourthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 4-2-4
        fourthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 5-2-4
        fifthRowSecondCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        
        // 1-3-4
        firstRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 2-3-4
        secondRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        // 3-3-4
        thirdRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFourthStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 4-3-4
        fourthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        // 5-3-4
        fifthRowThirdCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        
        // 1-4-4
        firstRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 2-4-4
        secondRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 3-4-4
        thirdRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFourthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 4-4-4
        fourthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        // 5-4-4
        fifthRowFourthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        
        // 1-5-4
        firstRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 2-5-4
        secondRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 3-5-4
        thirdRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFourthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 4-5-4
        fourthRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
        // 5-5-4
        fifthRowFifthCulmnFourthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFourthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length))
    
        // 5Strata
        // 1-1-5
        firstRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFirstCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! +  length * 2), ((anchor?.position.z)! - length * 2))
        // 2-1-5
        secondRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFirstCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        // 3-1-5
        thirdRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFirstCulmnFifthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        // 4-1-5
        fourthRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFirstCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        // 5-1-5
        fifthRowFirstCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFirstCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length * 2), ((anchor?.position.z)! - length * 2))
        
        
        
        // 1-2-5
        firstRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowSecondCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! + length),  ((anchor?.position.z)! - length * 2))
        // 2-2-5
        secondRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowSecondCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        // 3-2-5
        thirdRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowSecondCulmnFifthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        // 4-2-5
        fourthRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowSecondCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        // 5-2-5
        fifthRowSecondCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowSecondCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length * 2))
        
        
        
        // 1-3-5
        firstRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowThirdCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        // 2-3-5
        secondRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowThirdCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        // 3-3-5
        thirdRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowThirdCulmnFifthStrataCube?.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        // 4-3-5
        fourthRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowThirdCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        // 5-3-5
        fifthRowThirdCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowThirdCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), (anchor?.position.y)!, ((anchor?.position.z)! - length * 2))
        
        
        
        // 1-4-5
        firstRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFourthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        // 2-4-5
        secondRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFourthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        // 3-4-5
        thirdRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFourthCulmnFifthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        // 4-4-5
        fourthRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFourthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        // 5-4-5
        fifthRowFourthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFourthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length * 2))
        
        
        // 1-5-5
        firstRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        firstRowFifthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        // 2-5-5
        secondRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        secondRowFifthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        // 3-5-5
        thirdRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        thirdRowFifthCulmnFifthStrataCube?.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        // 4-5-5
        fourthRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fourthRowFifthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        // 5-5-5
        fifthRowFifthCulmnFifthStrataCube = ModelEntity(mesh: mesh, materials: [material])
        fifthRowFifthCulmnFifthStrataCube?.position = simd_make_float3(((anchor?.position.x)! + length * 2), ((anchor?.position.y)! - length * 2), ((anchor?.position.z)! - length * 2))
        
       
       
        
        
        // センターキューブ
//        let cube = ModelEntity(mesh: mesh, materials: [material])
//        cube.position = anchor!.position
        
//        centerAnchor.addChild(cube)
        anchor?.addChild(firstRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(firstRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(firstRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(firstRowFirstCulmnFourthStrataCube!)
        anchor?.addChild(firstRowFirstCulmnFifthStrataCube!)

        anchor?.addChild(firstRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(firstRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(firstRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(firstRowSecondCulmnFourthStrataCube!)
        anchor?.addChild(firstRowSecondCulmnFifthStrataCube!)
        
        anchor?.addChild(firstRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(firstRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(firstRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(firstRowThirdCulmnFourthStrataCube!)
        anchor?.addChild(firstRowThirdCulmnFifthStrataCube!)
        
        anchor?.addChild(firstRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(firstRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(firstRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(firstRowFourthCulmnFourthStrataCube!)
        anchor?.addChild(firstRowFourthCulmnFifthStrataCube!)
        
        anchor?.addChild(firstRowFifthCulmnFirstStrataCube!)
        anchor?.addChild(firstRowFifthCulmnSecondStrataCube!)
        anchor?.addChild(firstRowFifthCulmnThirdStrataCube!)
        anchor?.addChild(firstRowFifthCulmnFourthStrataCube!)
        anchor?.addChild(firstRowFifthCulmnFifthStrataCube!)
        
        // 2
        anchor?.addChild(secondRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFirstCulmnFourthStrataCube!)
        anchor?.addChild(secondRowFirstCulmnFifthStrataCube!)
        
        anchor?.addChild(secondRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(secondRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(secondRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(secondRowSecondCulmnFourthStrataCube!)
        anchor?.addChild(secondRowSecondCulmnFifthStrataCube!)
        
        anchor?.addChild(secondRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(secondRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(secondRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(secondRowThirdCulmnFourthStrataCube!)
        anchor?.addChild(secondRowThirdCulmnFifthStrataCube!)
        
        anchor?.addChild(secondRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFourthCulmnFourthStrataCube!)
        anchor?.addChild(secondRowFourthCulmnFifthStrataCube!)
        
        anchor?.addChild(secondRowFifthCulmnFirstStrataCube!)
        anchor?.addChild(secondRowFifthCulmnSecondStrataCube!)
        anchor?.addChild(secondRowFifthCulmnThirdStrataCube!)
        anchor?.addChild(secondRowFifthCulmnFourthStrataCube!)
        anchor?.addChild(secondRowFifthCulmnFifthStrataCube!)
        
        // 3
        anchor?.addChild(thirdRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnFourthStrataCube!)
        anchor?.addChild(thirdRowFirstCulmnFifthStrataCube!)
        
        anchor?.addChild(thirdRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnFourthStrataCube!)
        anchor?.addChild(thirdRowSecondCulmnFifthStrataCube!)
        
        anchor?.addChild(thirdRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnFourthStrataCube!)
        anchor?.addChild(thirdRowThirdCulmnFifthStrataCube!)
        
        anchor?.addChild(thirdRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnFourthStrataCube!)
        anchor?.addChild(thirdRowFourthCulmnFifthStrataCube!)
        
        anchor?.addChild(thirdRowFifthCulmnFirstStrataCube!)
        anchor?.addChild(thirdRowFifthCulmnSecondStrataCube!)
        anchor?.addChild(thirdRowFifthCulmnThirdStrataCube!)
        anchor?.addChild(thirdRowFifthCulmnFourthStrataCube!)
        anchor?.addChild(thirdRowFifthCulmnFifthStrataCube!)
        
        // 4
        anchor?.addChild(fourthRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnFourthStrataCube!)
        anchor?.addChild(fourthRowFirstCulmnFifthStrataCube!)
        
        anchor?.addChild(fourthRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnFourthStrataCube!)
        anchor?.addChild(fourthRowSecondCulmnFifthStrataCube!)
        
        anchor?.addChild(fourthRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnFourthStrataCube!)
        anchor?.addChild(fourthRowThirdCulmnFifthStrataCube!)
        
        anchor?.addChild(fourthRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnFourthStrataCube!)
        anchor?.addChild(fourthRowFourthCulmnFifthStrataCube!)

        anchor?.addChild(fourthRowFifthCulmnFirstStrataCube!)
        anchor?.addChild(fourthRowFifthCulmnSecondStrataCube!)
        anchor?.addChild(fourthRowFifthCulmnThirdStrataCube!)
        anchor?.addChild(fourthRowFifthCulmnFourthStrataCube!)
        anchor?.addChild(fourthRowFifthCulmnFifthStrataCube!)

        // 5
        anchor?.addChild(fifthRowFirstCulmnFirstStrataCube!)
        anchor?.addChild(fifthRowFirstCulmnSecondStrataCube!)
        anchor?.addChild(fifthRowFirstCulmnThirdStrataCube!)
        anchor?.addChild(fifthRowFirstCulmnFourthStrataCube!)
        anchor?.addChild(fifthRowFirstCulmnFifthStrataCube!)
        
        anchor?.addChild(fifthRowSecondCulmnFirstStrataCube!)
        anchor?.addChild(fifthRowSecondCulmnSecondStrataCube!)
        anchor?.addChild(fifthRowSecondCulmnThirdStrataCube!)
        anchor?.addChild(fifthRowSecondCulmnFourthStrataCube!)
        anchor?.addChild(fifthRowSecondCulmnFifthStrataCube!)
        
        anchor?.addChild(fifthRowThirdCulmnFirstStrataCube!)
        anchor?.addChild(fifthRowThirdCulmnSecondStrataCube!)
        anchor?.addChild(fifthRowThirdCulmnThirdStrataCube!)
        anchor?.addChild(fifthRowThirdCulmnFourthStrataCube!)
        anchor?.addChild(fifthRowThirdCulmnFifthStrataCube!)
        
        anchor?.addChild(fifthRowFourthCulmnFirstStrataCube!)
        anchor?.addChild(fifthRowFourthCulmnSecondStrataCube!)
        anchor?.addChild(fifthRowFourthCulmnThirdStrataCube!)
        anchor?.addChild(fifthRowFourthCulmnFourthStrataCube!)
        anchor?.addChild(fifthRowFourthCulmnFifthStrataCube!)
        
        anchor?.addChild(fifthRowFifthCulmnFirstStrataCube!)
        anchor?.addChild(fifthRowFifthCulmnSecondStrataCube!)
        anchor?.addChild(fifthRowFifthCulmnThirdStrataCube!)
        anchor?.addChild(fifthRowFifthCulmnFourthStrataCube!)
        anchor?.addChild(fifthRowFifthCulmnFifthStrataCube!)
        
               // 追加
        arView.scene.addAnchor(anchor!)
        
        // 発射処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let anime = firstCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
    }
    
    // シールド生成
    func makeShield() {
        
        // 初期化
        if let shieldAnchor = self.shieldAnchor {
            self.shieldAnchor = nil
            shieldAnchor.removeFromParent()
        }
        // AnchorEntity生成
        shieldAnchor = AnchorEntity()
        // カメラ座標
        let transform = arView.cameraTransform.translation
        let infrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 1.0)
        
        let goalInfrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 2.0)
        // カメラ座標　→ ワールド座標
        let cubePositon = shieldAnchor?.convert(position: goalInfrontOfCamera, to: worldAnchor)
        
        let movePosition = float4x4.init(translation: cubePositon!)
      
        shieldAnchor?.position = infrontOfCamera
        
        
        // cube実装
        let mesh = MeshResource.generateBox(size: [0.5, 0.9, 0.009])
        let material = SimpleMaterial(color: .magenta.withAlphaComponent(0.5), isMetallic: false)
        shieldModel = ModelEntity(mesh: mesh, materials: [material])
        
        
        shieldModel?.name = "shield"
        shieldModel?.generateCollisionShapes(recursive: false)
        
        shieldModel?.durableValue = 27
        
        
        shieldAnchor?.addChild(shieldModel!)
        // 追加
        arView.scene.addAnchor(shieldAnchor!)
    }
    
    // 衝突じの処理
    func onCollisionBegan(_ event: CollisionEvents.Began) {
        if event.entityA.name == "shield" && event.entityB.name == "cube" {
                        print("ffffffffffffffffffoooooooooooooo")
            
            // 点数計算
            let shield = event.entityA
            let cube = event.entityB
            
            let answer = shield.durableValue - cube.durableValue
            
            shield.durableValue -= cube.durableValue
            cube.durableValue -= shield.durableValue
            
            if shield.durableValue <= 0 {
                // シールド破壊
            }
            
            if cube.durableValue <= 0 {
                // cube破壊
            }
            
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
    
    func makeNineCubesShooterVer() {
        // 初期化
        if let anchor = self.anchor {
            self.anchor = nil
            anchor.removeFromParent()
        }
        
        // AnchorEntity生成
        anchor = AnchorEntity()
        
        // カメラ座標
        let transform = arView.cameraTransform.translation
        let infrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 0.3)
        
        let goalInfrontOfCamera = SIMD3<Float>(x: transform.x, y: transform.y, z: transform.z - 2.0)
        // カメラ座標　→ ワールド座標
        let cubePositon = anchor?.convert(position: goalInfrontOfCamera, to: worldAnchor)
        
        let movePosition = float4x4.init(translation: cubePositon!)
        

        anchor?.position = infrontOfCamera
        
        

        
        // cube実装
        let size = Float(0.09 / 3.0)
        let length = size + size / 5
        let mesh = MeshResource.generateBox(size: [size, size, size])
        let material = SimpleMaterial(color: .cyan.withAlphaComponent(0.9), isMetallic: false)
        
        // 1
        
        let firstCube1 = ModelEntity(mesh: mesh, materials: [material])
        firstCube1.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        firstCube1.name = "cube"
        firstCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let secondCube1 = ModelEntity(mesh: mesh, materials: [material])
        secondCube1.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), (anchor?.position.z)!)
        secondCube1.name = "cube"
        secondCube1.generateCollisionShapes(recursive: false)
        secondCube1.durableValue = 1
        
        let thirdCube1 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube1.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), (anchor?.position.z)!)
        thirdCube1.name = "cube"
        thirdCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let fourthCube1 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube1.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, (anchor?.position.z)!)
        fourthCube1.name = "cube"
        fourthCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let fifthCube1 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube1.position = anchor!.position
        fifthCube1.name = "cube"
        fifthCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let sixthCube1 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube1.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, (anchor?.position.z)!)
        sixthCube1.name = "cube"
        firstCube1.durableValue = 1
        
        let seventhCube1 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube1.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        seventhCube1.name = "cube"
        seventhCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let eighthCube1 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube1.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), (anchor?.position.z)!)
        eighthCube1.name = "cube"
        eighthCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        let ninethCube1 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube1.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), (anchor?.position.z)!)
        ninethCube1.name = "cube"
        ninethCube1.generateCollisionShapes(recursive: false)
        firstCube1.durableValue = 1
        
        // 2
        let firstCube2 = ModelEntity(mesh: mesh, materials: [material])
        firstCube2.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        firstCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let secondCube2 = ModelEntity(mesh: mesh, materials: [material])
        secondCube2.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        secondCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let thirdCube2 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube2.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! + length))
        thirdCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let fourthCube2 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube2.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        fourthCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let fifthCube2 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube2.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! + length))
        fifthCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let sixthCube2 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube2.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! + length))
        sixthCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let seventhCube2 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube2.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        seventhCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let eighthCube2 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube2.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        eighthCube2.name = "cube"
        firstCube1.durableValue = 1
        
        let ninethCube2 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube2.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! + length))
        ninethCube2.name = "cube"
        firstCube1.durableValue = 1
        
        // 3
        let firstCube3 = ModelEntity(mesh: mesh, materials: [material])
        firstCube3.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        firstCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let secondCube3 = ModelEntity(mesh: mesh, materials: [material])
        secondCube3.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        secondCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let thirdCube3 = ModelEntity(mesh: mesh, materials: [material])
        thirdCube3.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! + length), ((anchor?.position.z)! - length))
        thirdCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let fourthCube3 = ModelEntity(mesh: mesh, materials: [material])
        fourthCube3.position = simd_make_float3(((anchor?.position.x)! - length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        fourthCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let fifthCube3 = ModelEntity(mesh: mesh, materials: [material])
        fifthCube3.position = simd_make_float3((anchor?.position.x)!, (anchor?.position.y)!, ((anchor?.position.z)! - length))
        fifthCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let sixthCube3 = ModelEntity(mesh: mesh, materials: [material])
        sixthCube3.position = simd_make_float3(((anchor?.position.x)! + length), (anchor?.position.y)!, ((anchor?.position.z)! - length))
        sixthCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let seventhCube3 = ModelEntity(mesh: mesh, materials: [material])
        seventhCube3.position = simd_make_float3(((anchor?.position.x)! - length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        seventhCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let eighthCube3 = ModelEntity(mesh: mesh, materials: [material])
        eighthCube3.position = simd_make_float3((anchor?.position.x)!, ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        eighthCube3.name = "cube"
        firstCube1.durableValue = 1
        
        let ninethCube3 = ModelEntity(mesh: mesh, materials: [material])
        ninethCube3.position = simd_make_float3(((anchor?.position.x)! + length), ((anchor?.position.y)! - length), ((anchor?.position.z)! - length))
        ninethCube3.name = "cube"
        firstCube1.durableValue = 1
        
        // センターキューブ

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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.1) {
            let anime = secondCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
            let anime = thirdCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.3) {
            let anime = fourthCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.4) {
            let anime = fifthCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            let anime = sixthCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.6) {
            let anime = seventhCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.7) {
            let anime = eighthCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.8) {
            let anime = ninethCube1.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.9) {
            let anime = firstCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            let anime = secondCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.1) {
            let anime = thirdCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.2) {
            let anime = fourthCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.3) {
            let anime = fifthCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.4) {
            let anime = sixthCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            let anime = seventhCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.6) {
            let anime = eighthCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.7) {
            let anime = ninethCube2.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.8) {
            let anime = firstCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.9) {
            let anime = secondCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            let anime = thirdCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.1) {
            let anime = fourthCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.2) {
            let anime = fifthCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.3) {
            let anime = sixthCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.4) {
            let anime = seventhCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
            let anime = eighthCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.6) {
            let anime = ninethCube3.move(to: movePosition, relativeTo: self.worldAnchor, duration: 2.0, timingFunction: .easeIn)
        }
        
        
        
    }

    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            if let myAnchor = anchor as? ARParticipantAnchor {
                // AnchorEntity生成
                let anchorEntity = AnchorEntity(anchor: myAnchor)
                
                
//                anchor2.position = infrontOfCamera
                
                
                // cube実装
                let mesh = MeshResource.generateBox(size: [0.09, 0.09, 0.09])
                let material = SimpleMaterial(color: .cyan, isMetallic: false)
                let cube = ModelEntity(mesh: mesh, materials: [material])
                
                anchorEntity.addChild(cube)
                arView.scene.addAnchor(anchorEntity)
                
                print("eye")
            }
        }
    }
    
    @IBAction func tappedMakeButton(_ sender: Any) {
        
       makeShield()
        makeNineCubesShooterVer()
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

extension Entity {
    
    private struct additional {
        static var durableValue: Int = 0
        static var type: cubeType = .one
        static var uuid: String = ""
    }
    
    var addedDurableValue: String {
        get {
            guard let durableValue = objc_getAssociatedObject(self, &additional.durableValue) as? String else {
                return ""
            }
            return durableValue
        }
        
        set objc_setAssociatedObject(self, &additional.durableValue, newValue, .OBJC_ASSOCIATEO)
    }
    
  
        
   
//    // 耐久値
//    var durableValue: Int {
//        get {
//            return self.durableValue
//        }
//
//        set {
//            self.durableValue += newValue
//        }
//    }
//
//
//
//    // uuid
//    var type: cubeType {
//
//        get {
//            return self.type
//        }
//
//        set {
//            self.type = newValue
//        }
//    }
//
//    var uuid: String {
//
//        get {
//            return self.uuid
//        }
//
//        set {
//            self.uuid = newValue
//        }
//    }
//
//    init(durableValue: Int, type: cubeType, uuid: String) {
//        self.durableValue = durableValue
//        self.type = type
//        self.uuid = uuid
//    }

    
    
}

enum cubeType {
    case one
    case four
    case sixteen
    case twentyFive
}
