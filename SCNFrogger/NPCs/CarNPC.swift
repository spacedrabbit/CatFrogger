//
//  CarNPC.swift
//  SCNFrogger
//
//  Created by Louis Tur on 8/5/16.
//  Copyright © 2016 RWDevCon. All rights reserved.
//

import Foundation
import SceneKit

enum CarDirection {
  case LeftToRight, RightToLeft
}

internal class CarNPC: SCNNode {
  internal let carScene: SCNScene = SCNScene(named: "assets.scnassets/Models/car.dae")!
  internal (set) var carNode: SCNNode = SCNNode()
  
  override init() {
    self.carNode = carScene.rootNode.childNodeWithName("Car", recursively: false)!
    super.init()
    
    let carMaterial = SCNMaterial()
    carMaterial.diffuse.contents = UIImage(named: "assets.scnassets/Textures/model_texture.tga")
    carMaterial.locksAmbientWithDiffuse = false
    carNode.geometry?.firstMaterial = carMaterial
    
    self.addChildNode(carNode)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

internal class CarGenerator {
  
  private struct CarOptions {
    var direction: CarDirection
    var physicsBody: SCNPhysicsBody
    var collisionMask: Int
    var categoryMask: Int
    var contactMask: Int
    var material: SCNMaterial
    var position: SCNVector3
  }
  
  private static let defaultOptions: CarOptions =
    CarOptions(direction: .RightToLeft,
               physicsBody: SCNPhysicsBody(),
               collisionMask: PhysicsCategory.None,
               categoryMask: PhysicsCategory.None,
               contactMask: PhysicsCategory.None,
               material: SCNMaterial(),
               position: SCNVector3(0.0, 0.0, 0.0))

  internal static let dispatch: CarGenerator = CarGenerator()
  private init () {}
  
  internal class func generate() -> CarNPC {
    return CarNPC()
  }
  
}