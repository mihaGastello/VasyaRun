//
//  GameScene.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Texture
    var bgTexture: SKTexture!
    
    // SpriteNodes
    var bg = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg01.jpg")
        createObjects()
        createGame()
        }
    
    func createObjects() {
        self.addChild(bgObject)
    }
    
    func createGame() {
        createBg()
    }
    
    func createBg() {
        bgTexture = SKTexture(imageNamed: "bg01.jpg")
        
        let moveBg = SKAction.moveBy(x: -bgTexture.size().width, y: 0, duration: 3)
        let replaceBg = SKAction.moveBy(x: bgTexture.size().width, y: 0, duration: 0)
        let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveBg, replaceBg]))
        
        for i in 0..<3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: size.width/4 + bgTexture.size().width * CGFloat(i), y: size.height/2.0)
            bg.size.height = self.frame.height
            bg.run(moveBgForever)
            bg.zPosition = -1
            bgObject.addChild(bg)
            
        }
    }
}
