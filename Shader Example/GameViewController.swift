//
//  GameViewController.swift
//  Shader Example
//
//  Created by Ben Liu on 31/12/19.
//  Copyright © 2019 Ben Liu. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    private var skView: SKView {
        get {
            return self.view as! SKView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.presentScene(scene)
    }
}
