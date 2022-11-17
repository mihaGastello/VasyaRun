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
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var hero = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var heroObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    
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
        self.addChild(groundObject)
        self.addChild(skyObject)
        self.addChild(heroObject)
    }
    
    func createGame() {
        createBg()
        createGround()
        createSky()
        createHero()
    }
    
    func createBg() {
        bgTexture = SKTexture(imageNamed: "bg01.jpg")
        
        let moveBg = SKAction.moveBy(x: -bgTexture.size().width, y: 0, duration: 5)
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
    
    func createGround() {
        ground = SKSpriteNode()
        ground.position = CGPoint.zero
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: self.frame.height/4))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.zPosition = 1
        groundObject.addChild(ground)
    }
    
    func createSky() {
        sky = SKSpriteNode()
        sky.position = CGPoint(x: 0, y: self.frame.maxY) // check it
        sky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width + 100,
                                                            height: self.frame.size.height - 100))
        sky.physicsBody?.isDynamic = false
        sky.zPosition = 1
        skyObject.addChild(sky)
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
        // hero.size.height = 80
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hero.size.width - 20, height: hero.size.height - 20))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup
        hero.physicsBody?.collisionBitMask = groundGroup // check it
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 1

        
        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: flyHeroTexture.size().height))
        
    }
}
