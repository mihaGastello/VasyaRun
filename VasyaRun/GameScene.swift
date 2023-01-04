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
    var carTexture: SKTexture!
    var deadHeroTexture: SKTexture!
    var backPoliceTexture: SKTexture!
    
    // SpriteNodes
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var hero = SKSpriteNode()
    var bottle = SKSpriteNode()
    var car = SKSpriteNode()
    var backPolice = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var heroObject = SKNode()
    var bottleObject = SKNode()
    var carObject = SKNode()
    var backPoliceObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var bottleGroup: UInt32 = 0x1 << 3
    var carGroup: UInt32 = 0x1 << 4
    var backPoliceGroup: UInt32 = 0x1 << 5
    
    // Timers
    var timerAddBottle = Timer()
    var timerAddCar = Timer()
    
    // Sounds
    var pickBottle = SKAction()
    var carSoundPreload = SKAction()
    
    // Array textures for animate
    var heroRunTextArr = [SKTexture]()
    var heroJumpTextArr = [SKTexture]()
    var backPoliceTextArr = [SKTexture]()
    var bottleTexturesArray = [SKTexture]()
    var carTexArr = [SKTexture]()
    var heroDeadTexArr = [SKTexture]()
    
    
    override func didMove(to view: SKView) {
        bgTexture = SKTexture(imageNamed: "bg03.jpg")
        runHeroTexture = SKTexture(imageNamed: "run_020.png")
        jumpHeroTexture = SKTexture(imageNamed: "run_000.png")
        
        heroRunTextArr = [
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
        
        heroJumpTextArr = [
            SKTexture(imageNamed: "run_000.png")]
        
        // Bottle texture
        bottleTexture = SKTexture(imageNamed: "bottle1.png")
        bottleHeroTexture = SKTexture(imageNamed: "bottle1.png")

        // Car texture
        carTexture = SKTexture(imageNamed: "car.png")
        
        // Back police texture
        backPoliceTexture = SKTexture(imageNamed: "bottle1.png")
        
        self.physicsWorld.contactDelegate = self
        createObjects()
        createGame()
        pickBottle = SKAction.playSoundFileNamed("pickBottle.mp3", waitForCompletion: false)
        carSoundPreload = SKAction.playSoundFileNamed("sirena", waitForCompletion: false)
        }
    
    func createObjects() {
        self.addChild(bgObject)
        self.addChild(groundObject)
        self.addChild(skyObject)
        self.addChild(heroObject)
        self.addChild(bottleObject)
        self.addChild(carObject)
        self.addChild(backPoliceObject)
    }
    
    func createGame() {
        createBg()
        createGround()
        createSky()
        createHero()
        createBackPolice()
        timerFuncBottle()
        timerFuncCar()
    }
    
    func createBg() {
        bgTexture = SKTexture(imageNamed: "bg03.jpg")
        
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
        //ground = SKSpriteNode()
        ground.position = CGPoint.zero
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width * 2, height: self.frame.height/4))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.zPosition = 1
        groundObject.addChild(ground)
    }
    
    func createSky() {
        sky = SKSpriteNode()
        sky.position = CGPoint(x: 0, y: self.frame.maxY) // check it
        sky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width * 2,
                                                            height: self.frame.size.height - 250))
        sky.physicsBody?.isDynamic = false
        sky.zPosition = 1
        skyObject.addChild(sky)
    }
    
    func createBackPolice() {
        backPolice.position = CGPoint(x: self.size.width/8, y: self.size.height/4)
        backPolice.physicsBody = SKPhysicsBody(texture: backPoliceTexture, size: backPoliceTexture.size())
        backPolice.physicsBody?.isDynamic = false
        backPolice.zPosition = 5
        backPoliceObject.addChild(backPolice)

    }
    
    
    func addHero(heroNode: SKSpriteNode, atPosition position: CGPoint) {
        hero = SKSpriteNode(texture: runHeroTexture)
        
        changeActionToRun()
        
        hero.position = position
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hero.size.width,
                                                             height: hero.size.height))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | bottleGroup | carGroup
        hero.physicsBody?.collisionBitMask = groundGroup | carGroup
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 10

        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: self.size.height/4))
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
        bottle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottle.size.width - 10,
                                                               height: bottle.size.height - 10))
        bottle.physicsBody?.restitution = 0
        bottle.position = CGPoint(x: self.size.width + 50,
                                  y: 0 + bottleTexture.size().height + 50 + pipeOffset)
        let moveBottle = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 5)
        let removeAction = SKAction.removeFromParent()
        let bottleMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveBottle, removeAction]))
        bottle.run(bottleMoveBgForever)
        
        bottle.physicsBody?.isDynamic = false
        bottle.physicsBody?.categoryBitMask = bottleGroup
        bottle.zPosition = 2
        bottleObject.addChild(bottle)
    }
    
    @objc func addCar() {
        if sound == true {
            run(carSoundPreload)
        }
        
        car = SKSpriteNode(texture: carTexture)
        carTexArr = [SKTexture(imageNamed: "car.png"),
                     SKTexture(imageNamed: "car2.png")]
        
        let carAnimation = SKAction.animate(with: carTexArr, timePerFrame: 0.25)
        let carStart = SKAction.repeatForever(carAnimation)
        car.run(carStart)
        
        car.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: car.size.width,
                                                            height: car.size.height))
        car.physicsBody?.restitution = 1
        car.position = CGPoint(x: self.size.width + 50,
                               y: self.size.height / 4)
        let moveCar = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 5)
        let removeActionCar = SKAction.removeFromParent()
        let carMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveCar, removeActionCar]))
        car.run(carMoveBgForever)
        
        //car.physicsBody?.collisionBitMask = groundGroup
        //car.physicsBody?.categoryBitMask = carGroup
        car.physicsBody?.isDynamic = false
        car.zPosition = 10
        carObject.addChild(car)
        
    }
    
    func timerFuncBottle() {
        timerAddBottle.invalidate()
        timerAddBottle = Timer.scheduledTimer(timeInterval: 4.0,
                                              target: self,
                                              selector: #selector(GameScene.addBottle),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func timerFuncCar() {
        timerAddCar.invalidate()
        timerAddCar = Timer.scheduledTimer(timeInterval: 8.0,
                                              target: self,
                                              selector: #selector(GameScene.addCar),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func changeActionToJump() {
        let heroJumpAnimation = SKAction.animate(with: heroJumpTextArr, timePerFrame: 1)
        let jumpHero = SKAction.repeatForever(heroJumpAnimation)
        hero.run(jumpHero)
    }
    
    func changeActionToRun() {
        let heroRunAnimation = SKAction.animate(with: heroRunTextArr, timePerFrame: 0.1)
        let runHero = SKAction.repeatForever(heroRunAnimation)
        hero.run(runHero)
    }
}
