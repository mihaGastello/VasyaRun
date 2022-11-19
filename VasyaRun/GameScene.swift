//
//  GameScene.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    var sound = true
    
    // logic: hero can jump only from ground, dont double jump
    var onGroung: Bool! 
    
    // Texture
    var bgTexture: SKTexture!
    var runHeroTexture: SKTexture!
    var jumpHeroTexture: SKTexture!
    var bottleTexture: SKTexture!
    var bottleHeroTexture: SKTexture!
    
    // SpriteNodes
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var hero = SKSpriteNode()
    var bottle = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var heroObject = SKNode()
    var bottleObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var bottleGroup: UInt32 = 0x1 << 3
    
    // Timers
    var timerAddBottle = Timer()
    
    // Sounds
    var pickBottlePreload = SKAction()
    
    // Array textures for animate
    var heroRunTexturesArray = [SKTexture]()
    var heroJumpTexturesArray = [SKTexture]()
    var bottleTexturesArray = [SKTexture]()
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg01.jpg")
        runHeroTexture = SKTexture(imageNamed: "run_020.png")
        jumpHeroTexture = SKTexture(imageNamed: "run_000.png")
        
        heroRunTexturesArray = [
            SKTexture(imageNamed: "run_004.png"),
            SKTexture(imageNamed: "run_008.png"),
            SKTexture(imageNamed: "run_012.png"),
            SKTexture(imageNamed: "run_016.png"),
            SKTexture(imageNamed: "run_020.png"),
            SKTexture(imageNamed: "run_024.png"),
            SKTexture(imageNamed: "run_028.png"),
            SKTexture(imageNamed: "run_032.png"),
            SKTexture(imageNamed: "run_036.png"),
            SKTexture(imageNamed: "run_040.png"),
            SKTexture(imageNamed: "run_000.png")]
        
        heroJumpTexturesArray = [
            SKTexture(imageNamed: "run_000.png")]
        
        // Bottle texture
        bottleTexture = SKTexture(imageNamed: "bottle1.png")
        bottleHeroTexture = SKTexture(imageNamed: "bottle1.png")

        
        self.physicsWorld.contactDelegate = self
        createObjects()
        createGame()
        
        pickBottlePreload = SKAction.playSoundFileNamed("pickBottle.mp3", waitForCompletion: false)
        }
    
    func createObjects() {
        self.addChild(bgObject)
        self.addChild(groundObject)
        self.addChild(skyObject)
        self.addChild(heroObject)
        self.addChild(bottleObject)
    }
    
    func createGame() {
        createBg()
        createGround()
        createSky()
        
        createHero()
        timerFunc()
   
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
                                                            height: self.frame.size.height - 200))
        sky.physicsBody?.isDynamic = false
        sky.zPosition = 1
        skyObject.addChild(sky)
    }
    
    func addHero(heroNode: SKSpriteNode, atPosition position: CGPoint) {
        hero = SKSpriteNode(texture: runHeroTexture)
        
        changeActionToRun()
        
        hero.position = position
        // hero.size.height = 80
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hero.size.width - 20, height: hero.size.height - 20))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | bottleGroup
        hero.physicsBody?.collisionBitMask = groundGroup // check it
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 1

        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: runHeroTexture.size().height))
    }
    
    @objc func addBottle() {
        bottle = SKSpriteNode(texture: bottleTexture)
        bottleTexturesArray = [
            SKTexture(imageNamed: "bottle1.png"),
            SKTexture(imageNamed: "bottle2.png"),
            SKTexture(imageNamed: "bottle3.png"),
            SKTexture(imageNamed: "bottle4.png")]
        
        let bottleAnimation = SKAction.animate(with: bottleTexturesArray, timePerFrame: 0.3)
        let bottleHero = SKAction.repeatForever(bottleAnimation)
        bottle.run(bottleHero)
        
        let movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        bottle.size.height = 40
        bottle.size.width = 40
        bottle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottle.size.height - 10,
                                                               height: bottle.size.width - 10))
        bottle.physicsBody?.restitution = 0
        bottle.position = CGPoint(x: self.size.width + 50,
                                  y: 0 + bottleTexture.size().height + 50 + pipeOffset)
        let moveBottle = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 5)
        let removeAction = SKAction.removeFromParent()
        let bottleMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveBottle, removeAction]))
        bottle.run(bottleMoveBgForever)
        
        bottle.physicsBody?.isDynamic = false
        bottle.physicsBody?.categoryBitMask = bottleGroup
        bottle.zPosition = 1
        bottleObject.addChild(bottle)
    }
    
    func timerFunc() {
        timerAddBottle.invalidate()
        timerAddBottle = Timer.scheduledTimer(timeInterval: 4.0,
                                              target: self,
                                              selector: #selector(GameScene.addBottle),
                                              userInfo: nil,
                                              repeats: true)
        
    }
    
    func changeActionToJump() {
        let heroJumpAnimation = SKAction.animate(with: heroJumpTexturesArray, timePerFrame: 1)
        let jumpHero = SKAction.repeatForever(heroJumpAnimation)
        hero.run(jumpHero)
    }
    
    func changeActionToRun() {
        let heroRunAnimation = SKAction.animate(with: heroRunTexturesArray, timePerFrame: 0.1)
        let runHero = SKAction.repeatForever(heroRunAnimation)
        hero.run(runHero)
    }
}
