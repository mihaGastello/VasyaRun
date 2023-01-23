//
//  GameScene.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var animations = AnimationClass()
    
    var sound = true
    var onGroung = true
    var onDeath = false
    var gameVCBgidge: GameViewController!
    
    // Texture
    var bgTexture: SKTexture!
    var runHeroTexture: SKTexture!
    var jumpHeroTexture: SKTexture!
    var bottleTexture: SKTexture!
    var bottleHeroTexture: SKTexture!
    var carTexture: SKTexture!
    var deadHeroTexture: SKTexture!
    var frontEnemyTexture: SKTexture!
    var backEnemyTexture: SKTexture!
    
    // SpriteNodes
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var hero = SKSpriteNode()
    var bottle = SKSpriteNode()
    var car = SKSpriteNode()
    var frontEnemy = SKSpriteNode()
    var backEnemy = SKSpriteNode()
    
    // Sprite Objects
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var heroObject = SKNode()
    var bottleObject = SKNode()
    var carObject = SKNode()
    var frontEnemyObject = SKNode()
    var backEnemyObject = SKNode()
    var backEnemyObjectTwo = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var bottleGroup: UInt32 = 0x1 << 3
    var carGroup: UInt32 = 0x1 << 4
    var frontEnemyGroup: UInt32 = 0x1 << 5
    var backEnemyGroup: UInt32 = 0x1 << 6
    
    // Timers
    var timerAddBottle = Timer()
    var timerAddCar = Timer()
    var timerAddPol = Timer()
    
    // Sounds
    var bottleSound = SKAction()
    var carSound = SKAction()
    var deadSound = SKAction()
    
    // Array textures for animate
    var heroRunTextArr = [SKTexture]()
    var heroJumpTextArr = [SKTexture]()
    var bottleTextArr = [SKTexture]()
    var carTextArr = [SKTexture]()
    var heroDeadTextArr = [SKTexture]()
    var backEnemyTextArr = [SKTexture]()
    var frontEnemyTextArr = [SKTexture]()
    
    
    override func didMove(to view: SKView) {
        runHeroTexture = SKTexture(imageNamed: "run_020.png")
        jumpHeroTexture = SKTexture(imageNamed: "run_000.png")
        deadHeroTexture = SKTexture(imageNamed: "dead.png")
        bottleTexture = SKTexture(imageNamed: "bottle1.png")
        carTexture = SKTexture(imageNamed: "car.png")
        backEnemyTexture = SKTexture(imageNamed: "ment0.png")
        frontEnemyTexture = SKTexture(imageNamed: "oment0.png")
        

        
        backEnemyTextArr = [
            SKTexture(imageNamed: "ment0.png"),
            SKTexture(imageNamed: "ment1.png"),
            SKTexture(imageNamed: "ment2.png"),
            SKTexture(imageNamed: "ment3.png"),
            SKTexture(imageNamed: "ment4.png"),
            SKTexture(imageNamed: "ment5.png"),
            SKTexture(imageNamed: "ment6.png"),
            SKTexture(imageNamed: "ment7.png"),
            SKTexture(imageNamed: "ment8.png"),
            SKTexture(imageNamed: "ment9.png"),
            SKTexture(imageNamed: "ment10.png")]
        
        heroJumpTextArr = [
            SKTexture(imageNamed: "run_000.png")]
        
        heroDeadTextArr = [
            SKTexture(imageNamed: "dead.png")]

        bottleTextArr = [
            SKTexture(imageNamed: "bottle1.png"),
            SKTexture(imageNamed: "bottle2.png"),
            SKTexture(imageNamed: "bottle3.png"),
            SKTexture(imageNamed: "bottle4.png")]

        carTextArr = [
            SKTexture(imageNamed: "car.png"),
            SKTexture(imageNamed: "car2.png")]
        
        frontEnemyTextArr = [
            SKTexture(imageNamed: "oment0.png"),
            SKTexture(imageNamed: "oment1.png"),
            SKTexture(imageNamed: "oment2.png"),
            SKTexture(imageNamed: "oment3.png"),
            SKTexture(imageNamed: "oment4.png"),
            SKTexture(imageNamed: "oment5.png"),
            SKTexture(imageNamed: "oment6.png"),
            SKTexture(imageNamed: "oment7.png"),
            SKTexture(imageNamed: "oment8.png"),
            SKTexture(imageNamed: "oment9.png"),
            SKTexture(imageNamed: "oment10.png")]
        
        self.physicsWorld.contactDelegate = self
        createObjects()
        createGame()
        bottleSound = SKAction.playSoundFileNamed("pickBottle.mp3", waitForCompletion: false)
        carSound = SKAction.playSoundFileNamed("sirena", waitForCompletion: false)
        deadSound = SKAction.playSoundFileNamed("electricDead.mp3", waitForCompletion: false)
        }
    
    func createObjects() {
        self.addChild(bgObject)
        self.addChild(groundObject)
        self.addChild(skyObject)
        self.addChild(heroObject)
        self.addChild(bottleObject)
        self.addChild(carObject)
        self.addChild(frontEnemyObject)
        self.addChild(backEnemyObject)
        self.addChild(backEnemyObjectTwo)
    }
    
    func createGame() {
        
        onGroung = true
        onDeath = false
        createBg()
        createGround()
        createSky()
        createHero()
        timerFuncPol()
        timerFuncBottle()
        timerFuncCar()
        addEnemy(position: CGPoint(x: self.size.width/8, y: self.size.height/4))
        addEnemy(position: CGPoint(x: self.size.width/9, y: self.size.height/4))
        addEnemy(position: CGPoint(x: self.size.width/16, y: self.size.height/4))
        gameVCBgidge.reloadButton.isHidden = true
        gameVCBgidge.reloadBG.isHidden = true
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
        ground.position = CGPoint.zero
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width * 3, height: self.frame.height/4))
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

    
    func addHero(heroNode: SKSpriteNode, atPosition position: CGPoint) {
        hero = SKSpriteNode(texture: runHeroTexture)
        
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
        
        changeActionToRun()
        
        hero.position = position
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hero.size.width,
                                                             height: hero.size.height))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | bottleGroup | frontEnemyGroup | backEnemyGroup
        hero.physicsBody?.collisionBitMask = groundGroup | backEnemyGroup
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 5
        heroObject.addChild(hero)
        print(hero.size.width)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: self.size.height/4))
    }
    
    @objc func addBottle() {
        bottle = SKSpriteNode(texture: bottleTexture)
        
        let bottleAnimation = SKAction.animate(with: bottleTextArr, timePerFrame: 0.3)
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
    
    @objc func addFrontEnemy() {
        
        frontEnemy = SKSpriteNode(texture: frontEnemyTexture)
        
        let polAnimation = SKAction.animate(with: frontEnemyTextArr, timePerFrame: 0.1)
        let polStart = SKAction.repeatForever(polAnimation)
        frontEnemy.run(polStart)
        
        frontEnemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:frontEnemy.size.width, height: frontEnemy.size.height))
        
        frontEnemy.position = CGPoint(x: self.size.width + 50, y: self.size.height/4)
        let movePol = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 7)
        let removeActionPol = SKAction.removeFromParent()
        let polMoveBgForever = SKAction.repeatForever(SKAction.sequence([movePol, removeActionPol]))
        frontEnemy.run(polMoveBgForever)
        frontEnemy.physicsBody?.restitution = 1
        frontEnemy.physicsBody?.categoryBitMask = frontEnemyGroup
        frontEnemy.physicsBody?.isDynamic = false
        frontEnemy.zPosition = 8
        frontEnemyObject.addChild(frontEnemy)
    }

    @objc func addCar() {
        if sound == true {
            run(bottleSound)
        }
        
        car = SKSpriteNode(texture: carTexture)

        let carAnimation = SKAction.animate(with: carTextArr, timePerFrame: 0.25)
        let carStart = SKAction.repeatForever(carAnimation)
        car.run(carStart)
        
        //car.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: car.size.width, height: car.size.height))
        car.position = CGPoint(x: self.size.width + 50,
                               y: self.size.height / 4)
        let moveCar = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 5)
        let removeActionCar = SKAction.removeFromParent()
        let carMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveCar, removeActionCar]))
        car.run(carMoveBgForever)
        car.zPosition = 10
        carObject.addChild(car)
        
    }
    
    func addEnemy(position: CGPoint) {
        
        backEnemy = SKSpriteNode(texture: backEnemyTexture)
        let backEnemyAnimation = SKAction.animate(with: backEnemyTextArr, timePerFrame: 0.1)
        let backEnemyAnim = SKAction.repeatForever(backEnemyAnimation)
        backEnemy.run(backEnemyAnim)
        backEnemy.position = position
        
        backEnemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: backEnemy.size.width,
                                                            height: backEnemy.size.height))
        backEnemy.physicsBody?.isDynamic = false
        backEnemy.zPosition = 7
        backEnemy.physicsBody?.categoryBitMask = backEnemyGroup
        backEnemyObject.addChild(backEnemy)
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
        timerAddCar = Timer.scheduledTimer(timeInterval: 7.0,
                                              target: self,
                                              selector: #selector(GameScene.addCar),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func timerFuncPol() {
        timerAddPol.invalidate()
        timerAddPol = Timer.scheduledTimer(timeInterval: 3.0,
                                           target: self,
                                           selector: #selector(GameScene.addFrontEnemy),
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
    
    func changeActionToDeath() {
        onDeath = true
        hero.size.height = 56
        hero.size.width = 87
        let heroDeadAnimation = SKAction.animate(with: heroDeadTextArr, timePerFrame: 1)
        hero.run(heroDeadAnimation)
    }
    
    func reloadGame() {
        scene?.isPaused = false
        
        frontEnemyObject.removeAllChildren()
        backEnemyObject.removeAllChildren()
        carObject.removeAllChildren()
        bottleObject.removeAllChildren()
        heroObject.removeAllChildren()
        skyObject.removeAllChildren()
        groundObject.removeAllChildren()
        bgObject.removeAllChildren()
        
        frontEnemyObject.speed = 1
        bottleObject.speed = 1
        heroObject.speed = 1
        carObject.speed = 1
        bgObject.speed = 1
        self.speed = 1
        
        createGame()
    }
    
}
