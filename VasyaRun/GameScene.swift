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
    var flyHeroTexture: SKTexture!
    
    // SpriteNodes
    var bg = SKSpriteNode()
    var hero = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    var heroObject = SKNode()
    
    // Array textures for animate
    var heroFlyTexturesArray = [SKTexture]()
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg01.jpg")
        flyHeroTexture = SKTexture(imageNamed: "run_000.png")
        
        createObjects()
        createGame()
        }
    
    func createObjects() {
        self.addChild(bgObject)
        self.addChild(heroObject)
    }
    
    func createGame() {
        createBg()
        createHero()
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
    
    func addHero(heroNode: SKSpriteNode, atPosition position: CGPoint) {
        hero = SKSpriteNode(texture: flyHeroTexture)
        
        // Animate hero
        heroFlyTexturesArray = [
            SKTexture(imageNamed: "run_000.png"),
            SKTexture(imageNamed: "run_004.png"),
            SKTexture(imageNamed: "run_008.png"),
            SKTexture(imageNamed: "run_012.png"),
            SKTexture(imageNamed: "run_016.png"),
            SKTexture(imageNamed: "run_020.png"),
            SKTexture(imageNamed: "run_024.png"),
            SKTexture(imageNamed: "run_028.png"),
            SKTexture(imageNamed: "run_032.png"),
            SKTexture(imageNamed: "run_036.png"),
            SKTexture(imageNamed: "run_040.png")]
        
        let heroFlyAnimation = SKAction.animate(with: heroFlyTexturesArray, timePerFrame: 0.1)
        let flyHero = SKAction.repeatForever(heroFlyAnimation)
        hero.run(flyHero)
        
        hero.position = position
        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: 0 + flyHeroTexture.size().height + 400))
       // hero.zPosition = -2 // kisluhin
    }
}
