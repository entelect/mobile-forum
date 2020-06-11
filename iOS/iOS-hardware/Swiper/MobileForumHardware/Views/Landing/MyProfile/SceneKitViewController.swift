//
//  SceneKitViewController.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/14.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import UIKit
import ARKit

class SceneKitViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        configurePlanetObject()
        hidesBottomBarWhenPushed = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func configurePlanetObject() {
        let sphere = SCNSphere(radius: 0.2) //20 Centimeters
        
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        
        sphere.materials = [material]
        sphere.segmentCount = 150
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = sphere
        
        let spin = CABasicAnimation(keyPath: "rotation")
        spin.toValue = SCNVector4(x: 0, y: 1, z: 0, w: .pi*2)
        spin.duration = 15
        spin.repeatCount = HUGE
        node.addAnimation(spin, forKey: "spin around")
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
    }
}

extension SceneKitViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-.pi / 2, 1, 0, 0)
            
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridMaterial]
            
            planeNode.geometry = plane
            node.addChildNode(planeNode)
        }
    }
}
