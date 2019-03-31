//
//  ViewController.swift
//  LoadingModels
//
//  Created by Mohammad Azam on 3/31/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.autoenablesDefaultLighting = true 
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        let fishScene = SCNScene(named: "fish.dae")
        guard let fishNode = fishScene?.rootNode.childNode(withName: "fishModel", recursively: true) else {
            fatalError("fishModel is not found")
        }
        
        fishNode.position = SCNVector3(0, 0, -1.0)
        scene.rootNode.addChildNode(fishNode)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
