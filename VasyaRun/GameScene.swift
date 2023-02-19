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
    var faceTexture: SKTexture!
    var shamTexture: SKTexture!
    
    // SpriteNodes
    var dirtyRam = SKSpriteNode()
    var povFasol = SKSpriteNode()
    var iskDram = SKSpriteNode()
    var bg = SKSpriteNode()
    
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var wall = SKSpriteNode()
    
    var hero = SKSpriteNode()
    var car = SKSpriteNode()
    var face = SKSpriteNode()
    var sham = SKSpriteNode()
    var dick = SKSpriteNode()
    
    // Sprite Objects
    var dirtyRamObject = SKNode()
    var bgObject = SKNode()
    
    var groundObject = SKNode()
    var skyObject = SKNode()
    var wallObject = SKNode()
    
    var heroObject = SKNode()
    var carObject = SKNode()
    var faceObject = SKNode()
    var shamObject = SKNode()
    var dickObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var carGroup: UInt32 = 0x1 << 3
    var faceGroup: UInt32 = 0x1 << 4
    var shamGroup: UInt32 = 0x1 << 5
    var dickGroup: UInt32 = 0x1 << 6
    var wallGroup: UInt32 = 0x1 << 7
    
    // Timers
    var timerAddDirtyRam = Timer()
    var timerAddIskDram = Timer()
    var timerAddPovFasol = Timer()
    var timerAddDick = Timer()
    var timerCar = Timer()
    var timerCarTwo = Timer()
    var timerAddPol = Timer()
    var timerFlash = Timer()
    var timerFlashTwo = Timer()
    var timerFlashThree = Timer()
    var timerFlashFour = Timer()
    var timerColView = Timer()
    var timerFace = Timer()
    var timerSham = Timer()
    var timerFaceTwo = Timer()
    var timerShamTwo = Timer()
    
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
    var faceTextArr = [SKTexture]()
    var shamTextArr = [SKTexture]()
    var backColorArr = [SKView] ()

    override func didMove(to view: SKView) {

        //self.physicsWorld.gravity = CGVectorMake(0, -1)
        
        dirtyRamTexture = SKTexture(imageNamed: "dirtyRam.png")
        iskDramTexture = SKTexture(imageNamed: "iskDram.png")
        povFasolTexture = SKTexture(imageNamed: "povFasol.png")
        runHeroTexture = SKTexture(imageNamed: "run_020.png")
        jumpHeroTexture = SKTexture(imageNamed: "run_000.png")
        bgTexture = SKTexture(imageNamed: "bg7.jpg")
        carTexture = SKTexture(imageNamed: "car1.png")
        dickTexture = SKTexture(imageNamed: "di1.png")
        faceTexture = SKTexture(imageNamed: "face5.png")
        shamTexture = SKTexture(imageNamed: "sham5.png")
        heroJumpTextArr = [SKTexture(imageNamed: "run_000.png")]
        //heroDeadTextArr = [SKTexture(imageNamed: "dead.png")]
        //deadHeroTexture = SKTexture(imageNamed: "dead.png")

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
            SKTexture(imageNamed: "car3.png")]
        
        faceTextArr = [
            SKTexture(imageNamed: "face1.png"),
            SKTexture(imageNamed: "face2.png"),
            SKTexture(imageNamed: "face3.png"),
            SKTexture(imageNamed: "face4.png"),
            SKTexture(imageNamed: "face5.png"),
            SKTexture(imageNamed: "face6.png"),
            SKTexture(imageNamed: "face7.png"),
            SKTexture(imageNamed: "face8.png"),
            SKTexture(imageNamed: "face9.png"),
            SKTexture(imageNamed: "face10.png"),
            SKTexture(imageNamed: "face11.png"),
            SKTexture(imageNamed: "face12.png")]
        
        shamTextArr = [
            SKTexture(imageNamed: "sham1.png"),
            SKTexture(imageNamed: "sham2.png"),
            SKTexture(imageNamed: "sham3.png"),
            SKTexture(imageNamed: "sham4.png"),
            SKTexture(imageNamed: "sham5.png"),
            SKTexture(imageNamed: "sham6.png"),
            SKTexture(imageNamed: "sham7.png"),
            SKTexture(imageNamed: "sham8.png"),
            SKTexture(imageNamed: "sham9.png"),
            SKTexture(imageNamed: "sham10.png"),
            SKTexture(imageNamed: "sham11.png"),
            SKTexture(imageNamed: "sham12.png")]
        
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
        self.addChild(wallObject)
        
        self.addChild(heroObject)
        self.addChild(carObject)
        self.addChild(dickObject)
        self.addChild(faceObject)
        self.addChild(shamObject)
        self.addChild(dirtyRamObject)
    }
    
    func createGame() {
        
        onGroung = true
        onDeath = false
        createBg()
        createGround()
        createSky()
        createWall()
        createHero()
        timerFuncDirtyRam()
        timerFuncIskDram()
        timerFuncPovFasol()
        timerFuncColorView(tim: timerColView, timInt: 30.1)
        timerFuncFlash(tim: timerFlash, timInt: 29.3)
        timerFuncFlash(tim: timerFlashTwo, timInt: 58.7)
        timerFuncFlash(tim: timerFlashThree, timInt: 102.5)
        timerFuncFlash(tim: timerFlashFour, timInt: 117)
        timerFuncFace(tim: timerFace, timInt: 40)
        timerFuncFace(tim: timerFaceTwo, timInt: 50)
        timerFuncSham(tim: timerSham, timInt: 45)
        timerFuncSham(tim: timerShamTwo, timInt: 55)
        timerFuncCar(tim: timerCar, timInt: 33)
        timerFuncCar(tim: timerCarTwo, timInt: 88)
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
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width * 3, height: self.frame.height/7))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        ground.zPosition = 1
        groundObject.addChild(ground)
    }
    
    func createSky() {
        sky = SKSpriteNode()
        sky.position = CGPoint(x: 0, y: self.frame.maxY)
        sky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width * 3,
                                                            height: self.frame.size.height / 6))
        sky.physicsBody?.isDynamic = false
        sky.zPosition = 1
        skyObject.addChild(sky)
    }
    
    func createWall() {
        wall = SKSpriteNode()
        wall.position = CGPoint(x: self.frame.minX, y: 0)
        wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width / 8,
                                                            height: self.frame.size.height * 2))
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.categoryBitMask = wallGroup
        wall.zPosition = 1
        wallObject.addChild(wall)
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
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: (hero.size.width - 10), height: hero.size.height))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | carGroup | wallGroup | faceGroup | shamGroup
        hero.physicsBody?.collisionBitMask = groundGroup | carGroup | wallGroup
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
        dick.size.height = 100
        dick.size.width = 100
        dick.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: dick.size.width - 10,
                                                               height: dick.size.height - 10))
        dick.physicsBody?.restitution = 0
        dick.position = CGPoint(x: self.size.width,
                                  y: 0 + dickTexture.size().height + 50 + pipeOffset)
        let moveDick = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0 , duration: 5)
        let removeAction = SKAction.removeFromParent()
        let dickMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveDick, removeAction]))
        dick.run(dickMoveBgForever)
        
        dick.physicsBody?.isDynamic = true
        //dick.physicsBody?.categoryBitMask = dickGroup
        dick.zPosition = 2
        dickObject.addChild(dick)
    }
    
    @objc func addDirtyRam() {
    
        dirtyRam = SKSpriteNode(texture: dirtyRamTexture)
        dirtyRam.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        dirtyRam.zPosition = 8
        dirtyRamObject.addChild(dirtyRam)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           self.dirtyRam.scale(to: CGSize(width: self.dirtyRam.size.width * 1.2,
                                          height: self.dirtyRam.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.dirtyRam.scale(to: CGSize(width: self.dirtyRam.size.width * 1.2,
                                               height: self.dirtyRam.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           self.povFasol.scale(to: CGSize(width: self.povFasol.size.width * 1.2,
                                          height: self.povFasol.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.povFasol.scale(to: CGSize(width: self.povFasol.size.width * 1.2,
                                               height: self.povFasol.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
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

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
           self.iskDram.scale(to: CGSize(width: self.iskDram.size.width * 1.2,
                                         height: self.iskDram.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.iskDram.scale(to: CGSize(width: self.iskDram.size.width * 1.2,
                                              height: self.iskDram.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.iskDram.removeFromParent()
                }
            }
        }
    }
    
    @objc func addFace() {
        face = SKSpriteNode(texture: faceTexture)
        let faceAnimation = SKAction.animate(with: faceTextArr, timePerFrame: 0.1)
        let faceStart = SKAction.repeatForever(faceAnimation)
        face.run(faceStart)
        face.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: face.size.height, height: face.size.height))
        face.position = CGPoint(x: self.size.width + 50, y: self.size.height/4)
        let moveFace = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 7)
        let removeActionFace = SKAction.removeFromParent()
        let faceMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveFace, removeActionFace]))
        face.run(faceMoveBgForever)
        face.physicsBody?.isDynamic = true
        face.physicsBody?.categoryBitMask = faceGroup
        face.physicsBody?.collisionBitMask = groundGroup | heroGroup | wallGroup
        face.physicsBody?.contactTestBitMask = heroGroup | wallGroup
        face.zPosition = 5
        faceObject.addChild(face)
    }

    @objc func addSham() {
        
        sham = SKSpriteNode(texture: shamTexture)
        let shamAnimation = SKAction.animate(with: shamTextArr, timePerFrame: 0.05)
        let shamStart = SKAction.repeatForever(shamAnimation)
        sham.run(shamStart)
        sham.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sham.size.height, height: sham.size.height))
        sham.position = CGPoint(x: self.size.width + 50, y: self.size.height/4)
        let moveSham = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 7)
        let removeActionSham = SKAction.removeFromParent()
        let shamMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveSham, removeActionSham]))
        sham.run(shamMoveBgForever)
        sham.physicsBody?.isDynamic = true
        sham.physicsBody?.collisionBitMask = groundGroup | heroGroup | wallGroup
        sham.physicsBody?.contactTestBitMask = heroGroup | wallGroup
        sham.zPosition = 5
        shamObject.addChild(sham)
    }
    
    @objc func addCar() {

        car = SKSpriteNode(texture: carTexture)

        let carAnimation = SKAction.animate(with: carTextArr, timePerFrame: 2)
        let carStart = SKAction.repeatForever(carAnimation)
        car.run(carStart)
        car.physicsBody = SKPhysicsBody(texture: carTexture,
                                        size: CGSize(width: carTexture.size().width, height: carTexture.size().height))
        car.position = CGPoint(x: self.size.width + 150, y: self.size.height / 4)
        let moveCar = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 15)
        let removeActionCar = SKAction.removeFromParent()
        let carMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveCar, removeActionCar]))
        car.run(carMoveBgForever)
        car.physicsBody?.categoryBitMask = carGroup
        car.physicsBody?.contactTestBitMask = groundGroup | heroGroup | wallGroup
        car.physicsBody?.collisionBitMask = groundGroup | heroGroup | wallGroup
        //car.physicsBody?.allowsRotation = false
        car.physicsBody?.isDynamic = false
        car.zPosition = 5
        carObject.addChild(car)
    }
    
    @objc func shakeAndFlashAnimation() {
        //White flash
        let aView = UIView(frame: self.view!.frame)
        aView.backgroundColor = UIColor.white
        self.view!.addSubview(aView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            aView.alpha = 0.0
            }) { (done) in aView.removeFromSuperview()
        }
        //Shake animation
        let shake = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(-15, 5, 5)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(15, 5, 5))]
        shake.autoreverses = true
        shake.repeatCount = 2
        shake.duration = 7/100
        self.view!.layer.add(shake, forKey: nil)
    }
    
    @objc func changeBackgroundColor() {
        let aView = UIView(frame: self.view!.frame)
        aView.layer.zPosition = 0
        aView.backgroundColor = UIColor.green
        self.view!.addSubview(aView)
        aView.alpha = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            aView.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                aView.backgroundColor = UIColor.blue
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                    aView.backgroundColor = UIColor.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        aView.backgroundColor = UIColor.purple
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                            aView.backgroundColor = UIColor.systemPink
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                                aView.removeFromSuperview()
                            }
                        }
                    }
                }
            }
        }
    }
   
    func timerFuncDirtyRam() {
        timerAddDirtyRam.invalidate()
        timerAddDirtyRam = Timer.scheduledTimer(timeInterval: 18.3,
                                              target: self,
                                              selector: #selector(GameScene.addDirtyRam),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    func timerFuncPovFasol() {
        timerAddPovFasol.invalidate()
        timerAddPovFasol = Timer.scheduledTimer(timeInterval: 10.9,
                                              target: self,
                                              selector: #selector(GameScene.addPovFasol),
                                              userInfo: nil,
                                              repeats: false)
    }

    func timerFuncIskDram() {
        timerAddIskDram.invalidate()
        timerAddIskDram = Timer.scheduledTimer(timeInterval: 3.5,
                                              target: self,
                                              selector: #selector(GameScene.addIskDram),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    
    func timerFuncDick() {
        timerAddDick.invalidate()
        timerAddDick = Timer.scheduledTimer(timeInterval: 20,
                                              target: self,
                                              selector: #selector(GameScene.addDick),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    func timerFuncCar(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(timeInterval: timInt,
                                              target: self,
                                              selector: #selector(GameScene.addCar),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    func timerFuncFace(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(timeInterval: timInt,
                                           target: self,
                                           selector: #selector(GameScene.addFace),
                                           userInfo: nil,
                                           repeats: false)
    }
    
    func timerFuncSham(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(timeInterval: timInt,
                                           target: self,
                                           selector: #selector(GameScene.addSham),
                                           userInfo: nil,
                                           repeats: false)
    }
    
    func timerFuncFlash(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(timeInterval: timInt,
                                        target: self,
                                        selector: #selector(GameScene.shakeAndFlashAnimation),
                                        userInfo: nil,
                                        repeats: false)
    }
    
    func timerFuncColorView(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(timeInterval: timInt,
                                   target: self,
                                   selector: #selector(GameScene.changeBackgroundColor),
                                   userInfo: nil,
                                   repeats: false)
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
        
        faceObject.removeAllChildren()
        carObject.removeAllChildren()
        heroObject.removeAllChildren()
        skyObject.removeAllChildren()
        groundObject.removeAllChildren()
        bgObject.removeAllChildren()
        
        faceObject.speed = 1
        heroObject.speed = 1
        carObject.speed = 1
        bgObject.speed = 1
        self.speed = 1
        
        createGame()
    }
    
}
