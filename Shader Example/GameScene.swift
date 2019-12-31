//
//  GameScene.swift
//  Shader Example
//
//  Created by Ben Liu on 31/12/19.
//  Copyright © 2019 Ben Liu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let fileURL = Bundle.main.path(forResource: "myShader", ofType: "fsh")
        do {
            let data = try String(contentsOfFile: fileURL!, encoding: .utf8)
            let shader = SKShader(source: data)
            let skAttribute = SKAttribute(name: "THE_MIGHTY_DARK_FACTOR", type: .float)
//            let treeSprite = SKSpriteNode(imageNamed: "Trees")
//            treeSprite.shader = shader
//            treeSprite.position = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
            shader.attributes = [skAttribute]
            let treeSprite1 = createTreeWithShader(shader: shader, mightyFactor: 0.3, zPosition: 1)
            let treeSprite2 = createTreeWithShader(shader: shader, mightyFactor: 0.3, zPosition: 2)
            let treeSprite3 = createTreeWithShader(shader: shader, mightyFactor: 0.3, zPosition: 3)
            self.addChild(treeSprite1)
            self.addChild(treeSprite2)
            self.addChild(treeSprite3)
        } catch {
            print("error")
        }
    }
    
    func createTreeWithShader(shader: SKShader, mightyFactor: CGFloat, zPosition: CGFloat) -> SKSpriteNode {
        let treeSprite = SKSpriteNode(imageNamed: "Trees")
        treeSprite.shader = shader
        treeSprite.position = CGPoint(x: view!.frame.width/2-CGFloat.random(in: 1..<100),
                                      y: view!.frame.height/2-CGFloat.random(in: 1..<100))
        treeSprite.attributeValues = ["THE_MIGHTY_DARK_FACTOR": SKAttributeValue(float: Float(mightyFactor))]
        treeSprite.zPosition = zPosition
        return treeSprite
    }
}
