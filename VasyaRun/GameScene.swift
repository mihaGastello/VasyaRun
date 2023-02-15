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
    var dirtyRamTexture: SKTexture!
    var iskDramTexture: SKTexture!
    var povFasolTexture: SKTexture!
    var paramTexture: SKTexture!
    var bgTexture: SKTexture!
    var runHeroTexture: SKTexture!
    var jumpHeroTexture: SKTexture!
    var dickTexture: SKTexture!
    var carTexture: SKTexture!
    var deadHeroTexture: SKTexture!
    var frontEnemyTexture: SKTexture!
//    var backEnemyTexture: SKTexture!
    
    // SpriteNodes
    var dirtyRam = SKSpriteNode()
    var povFasol = SKSpriteNode()
    var iskDram = SKSpriteNode()
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var hero = SKSpriteNode()
    var car = SKSpriteNode()
    var frontEnemy = SKSpriteNode()
//    var backEnemy = SKSpriteNode()
    var dick = SKSpriteNode()
    
    // Sprite Objects
    var dirtyRamObject = SKNode()
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var heroObject = SKNode()
    var carObject = SKNode()
    var frontEnemyObject = SKNode()
    var backEnemyObject = SKNode()
    var dickObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var carGroup: UInt32 = 0x1 << 3
    var frontEnemyGroup: UInt32 = 0x1 << 4
//    var backEnemyGroup: UInt32 = 0x1 << 6
    var dickGroup: UInt32 = 0x1 << 7
    
    // Timers
    var timerAddDirtyRam = Timer()
    var timerAddIskDram = Timer()
    var timerAddPovFasol = Timer()
    var timerAddDick = Timer()
    var timerAddCar = Timer()
    var timerAddPol = Timer()
    
    // Sounds
    var bottleSound = SKAction()
    var carSound = SKAction()
    var deadSound = SKAction()
    
    // Array textures for animate
    var heroRunTextArr = [SKTexture]()
    var heroJumpTextArr = [SKTexture]()
    var dickTextArr = [SKTexture]()
    var carTextArr = [SKTexture]()
    var heroDeadTextArr = [SKTexture]()
    var frontEnemyTextArr = [SKTexture]()
    
    
    override func didMove(to view: SKView) {
        
        dirtyRamTexture = SKTexture(imageNamed: "dirtyRam.png")
        iskDramTexture = SKTexture(imageNamed: "iskDram.png")
        povFasolTexture = SKTexture(imageNamed: "povFasol.png")
        runHeroTexture = SKTexture(imageNamed: "run_020.png")
        jumpHeroTexture = SKTexture(imageNamed: "run_000.png")
        deadHeroTexture = SKTexture(imageNamed: "dead.png")
        bgTexture = SKTexture(imageNamed: "bg7.jpg")
        carTexture = SKTexture(imageNamed: "car1.png")
        dickTexture = SKTexture(imageNamed: "di1.png")
        frontEnemyTexture = SKTexture(imageNamed: "oment0.png")
        
        heroJumpTextArr = [
            SKTexture(imageNamed: "run_000.png")]
        
        heroDeadTextArr = [
            SKTexture(imageNamed: "dead.png")]

        dickTextArr = [
            SKTexture(imageNamed: "di1.png"),
            SKTexture(imageNamed: "di2.png"),
            SKTexture(imageNamed: "di3.png"),
            SKTexture(imageNamed: "di4.png"),
            SKTexture(imageNamed: "di5.png"),
            SKTexture(imageNamed: "di6.png"),
            SKTexture(imageNamed: "di7.png"),
            SKTexture(imageNamed: "di8.png"),
            SKTexture(imageNamed: "di9.png"),
            SKTexture(imageNamed: "di10.png"),
            SKTexture(imageNamed: "di11.png"),
            SKTexture(imageNamed: "di12.png")]
        
        carTextArr = [
            SKTexture(imageNamed: "car1.png"),
            SKTexture(imageNamed: "car2.png"),
            SKTexture(imageNamed: "car3.png")
        ]
        
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
        self.addChild(carObject)
        self.addChild(dickObject)
        self.addChild(frontEnemyObject)
        self.addChild(dirtyRamObject)

    }
    
    func createGame() {
        
        onGroung = true
        onDeath = false
        createBg()
        createGround()
        createSky()
        createHero()
        timerFuncDirtyRam()
        timerFuncIskDram()
        timerFuncPovFasol()
        timerFuncPol()
        timerFuncDick()
        timerFuncCar()
        gameVCBgidge.reloadButton.isHidden = true
        gameVCBgidge.reloadBG.isHidden = true
    }
    
    func createBg() {
        bgTexture = SKTexture(imageNamed: "bg7.jpg")
        
        let moveBg = SKAction.moveBy(x: -self.frame.width * 2, y: 0, duration: 15)
        let replaceBg = SKAction.moveBy(x: self.frame.width * 2, y: 0, duration: 0)
        let moveBgForever = SKAction.repeatForever(SKAction.sequence([moveBg, replaceBg]))
        
        for i in 0..<3 {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: size.width/4 + self.frame.width * 2 * CGFloat(i), y: size.height/2.0)
            bg.scale(to: CGSize(width: self.frame.width * 2, height: self.frame.height))
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
        hero.physicsBody?.contactTestBitMask = groundGroup | dickGroup | frontEnemyGroup
        hero.physicsBody?.collisionBitMask = groundGroup | carGroup
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 5
        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4, y: self.size.height/4))
    }
    
    
    @objc func addDick() {
        dick = SKSpriteNode(texture: dickTexture)
        
        let dickAnimation = SKAction.animate(with: dickTextArr, timePerFrame: 0.05)
        let dickHero = SKAction.repeatForever(dickAnimation)
        dick.run(dickHero)
        
        let movementAmount = arc4random() % UInt32(self.frame.size.height)
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 2
        dick.size.height = 80
        dick.size.width = 80
        dick.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: dick.size.width - 10,
                                                               height: dick.size.height - 10))
        dick.physicsBody?.restitution = 0
        dick.position = CGPoint(x: self.size.width,
                                  y: 0 + dickTexture.size().height + 50 + pipeOffset)
        let moveDick = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 5)
        let removeAction = SKAction.removeFromParent()
        let dickMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveDick, removeAction]))
        dick.run(dickMoveBgForever)
        
        dick.physicsBody?.isDynamic = false
        dick.physicsBody?.categoryBitMask = dickGroup
        dick.zPosition = 2
        dickObject.addChild(dick)
    }
    
    @objc func addDirtyRam() {
    
        dirtyRam = SKSpriteNode(texture: dirtyRamTexture)
        dirtyRam.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        dirtyRam.zPosition = 8
        dirtyRamObject.addChild(dirtyRam)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
           self.dirtyRam.scale(to: CGSize(width: self.dirtyRam.size.width * 1.2,
                                          height: self.dirtyRam.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.dirtyRam.scale(to: CGSize(width: self.dirtyRam.size.width * 1.2,
                                               height: self.dirtyRam.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.dirtyRam.removeFromParent()
                }
            }
        }
    }
    
    @objc func addPovFasol() {

        povFasol = SKSpriteNode(texture: povFasolTexture)
        povFasol.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        povFasol.zPosition = 8
        dirtyRamObject.addChild(povFasol)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
           self.povFasol.scale(to: CGSize(width: self.povFasol.size.width * 1.2,
                                          height: self.povFasol.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.povFasol.scale(to: CGSize(width: self.povFasol.size.width * 1.2,
                                               height: self.povFasol.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.povFasol.removeFromParent()
                }
            }
        }
    }
    
    @objc func addIskDram() {

        iskDram = SKSpriteNode(texture: iskDramTexture)
        iskDram.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        iskDram.zPosition = 8
        dirtyRamObject.addChild(iskDram)

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
           self.iskDram.scale(to: CGSize(width: self.iskDram.size.width * 1.2,
                                         height: self.iskDram.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.iskDram.scale(to: CGSize(width: self.iskDram.size.width * 1.2,
                                              height: self.iskDram.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.iskDram.removeFromParent()
                }
            }
        }
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

        let carAnimation = SKAction.animate(with: carTextArr, timePerFrame: 2)
        let carStart = SKAction.repeatForever(carAnimation)
        car.run(carStart)
        
        car.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: car.size.width, height: car.size.height))
        car.position = CGPoint(x: self.size.width + 50,
                               y: self.size.height / 4)
        let moveCar = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 15)
        let removeActionCar = SKAction.removeFromParent()
        let carMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveCar, removeActionCar]))
        car.run(carMoveBgForever)
        car.zPosition = 10
        carObject.addChild(car)
        
    }
   
    func timerFuncDirtyRam() {
        timerAddDirtyRam.invalidate()
        timerAddDirtyRam = Timer.scheduledTimer(timeInterval: 2.0,
                                              target: self,
                                              selector: #selector(GameScene.addDirtyRam),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    func timerFuncPovFasol() {
        timerAddPovFasol.invalidate()
        timerAddPovFasol = Timer.scheduledTimer(timeInterval: 10.0,
                                              target: self,
                                              selector: #selector(GameScene.addPovFasol),
                                              userInfo: nil,
                                              repeats: false)
    }

    func timerFuncIskDram() {
        timerAddIskDram.invalidate()
        timerAddIskDram = Timer.scheduledTimer(timeInterval: 18.0,
                                              target: self,
                                              selector: #selector(GameScene.addIskDram),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    
    func timerFuncDick() {
        timerAddDick.invalidate()
        timerAddDick = Timer.scheduledTimer(timeInterval: 10.0,
                                              target: self,
                                              selector: #selector(GameScene.addDick),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func timerFuncCar() {
        timerAddCar.invalidate()
        timerAddCar = Timer.scheduledTimer(timeInterval: 13.0,
                                              target: self,
                                              selector: #selector(GameScene.addCar),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func timerFuncPol() {
        timerAddPol.invalidate()
        timerAddPol = Timer.scheduledTimer(timeInterval: 15.0,
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
  //      backEnemyObject.removeAllChildren()
        carObject.removeAllChildren()
        heroObject.removeAllChildren()
        skyObject.removeAllChildren()
        groundObject.removeAllChildren()
        bgObject.removeAllChildren()
        
        frontEnemyObject.speed = 1
        heroObject.speed = 1
        carObject.speed = 1
        bgObject.speed = 1
        self.speed = 1
        
        createGame()
    }
    
}
