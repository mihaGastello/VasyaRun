//
//  GameScene.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //var animations = AnimationClass()
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
    var morgTexture: SKTexture!
    var whiteBoomTexture: SKTexture!
    var guysTexture: SKTexture!
    var sleepTexture: SKTexture!
    var tableTexture: SKTexture!
    
    // SpriteNodes
    var dirtyRam = SKSpriteNode()
    var povFasol = SKSpriteNode()
    var iskDram = SKSpriteNode()
    var title = SKSpriteNode()
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var wall = SKSpriteNode()
    var hero = SKSpriteNode()
    var car = SKSpriteNode()
    var face = SKSpriteNode()
    var sham = SKSpriteNode()
    var morg = SKSpriteNode()
    var dick = SKSpriteNode()
    var colorizedBack = SKSpriteNode()
    var whiteBoom = SKSpriteNode()
    var guys = SKSpriteNode()
    var sleep = SKSpriteNode()
    var table = SKSpriteNode()
    
    // Sprite Objects
    var dirtyRamObject = SKNode()
    var bgObject = SKNode()
    var groundObject = SKNode()
    var skyObject = SKNode()
    var wallObject = SKNode()
    var heroObject = SKNode()
    var carObject = SKNode()
    var headObject = SKNode()
    var titleObject = SKNode()
    // var shamObject = SKNode()
    var dickObject = SKNode()
    var boomObject = SKNode()
    var backPersonObject = SKNode()
    
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
    var timerFlashFive = Timer()
    var timerColView = Timer()
    var timerColViewTwo = Timer()
    var timerColViewThree = Timer()
    var timerColViewFour = Timer()
    var timerFace = Timer()
    var timerSham = Timer()
    var timerFaceTwo = Timer()
    var timerShamTwo = Timer()
    var timerStopGame = Timer()
    var timerBackSleep = Timer()
    var timerBackGuys = Timer()
    var timerBackTable = Timer()
    var timerMorg = Timer()
    var timerMorgTwo = Timer()
    
    // Sounds
    //    var bottleSound = SKAction()
    
    // Array textures for animate
    var heroRunTextArr = [SKTexture]()
    var heroJumpTextArr = [SKTexture]()
    var dickTextArr = [SKTexture]()
    var carTextArr = [SKTexture]()
    var heroDeadTextArr = [SKTexture]()
    var faceTextArr = [SKTexture]()
    var shamTextArr = [SKTexture]()
    var morgTextArr = [SKTexture]()
    var whiteBoomTextArr = [SKTexture]()
    
    override func didMove(to view: SKView) {
        
        guysTexture = SKTexture(imageNamed: "guys.png")
        sleepTexture = SKTexture(imageNamed: "sleep.png")
        tableTexture = SKTexture(imageNamed: "table.png")
        
        dirtyRamTexture = SKTexture(imageNamed: "dirtyRam.png")
        iskDramTexture = SKTexture(imageNamed: "iskDram.png")
        povFasolTexture = SKTexture(imageNamed: "povFasol.png")
        runHeroTexture = SKTexture(imageNamed: "hero14.png")
        jumpHeroTexture = SKTexture(imageNamed: "hero14.png")
        bgTexture = SKTexture(imageNamed: "bg7.jpg")
        carTexture = SKTexture(imageNamed: "car1.png")
        dickTexture = SKTexture(imageNamed: "di1.png")
        
        faceTexture = SKTexture(imageNamed: "face1.png")
        shamTexture = SKTexture(imageNamed: "sham1.png")
        morgTexture = SKTexture(imageNamed: "morg1.png")
        
        heroJumpTextArr = [SKTexture(imageNamed: "hero14.png")]
        whiteBoomTexture = SKTexture(imageNamed: "cloud200.png")
        
        whiteBoomTextArr = [
            SKTexture(imageNamed: "cloud200.png"),
            SKTexture(imageNamed: "cloud400.png")]
        
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
        
        morgTextArr = [
            SKTexture(imageNamed: "morg1.png"),
            SKTexture(imageNamed: "morg2.png"),
            SKTexture(imageNamed: "morg3.png"),
            SKTexture(imageNamed: "morg4.png"),
            SKTexture(imageNamed: "morg5.png"),
            SKTexture(imageNamed: "morg6.png"),
            SKTexture(imageNamed: "morg7.png"),
            SKTexture(imageNamed: "morg8.png"),
            SKTexture(imageNamed: "morg9.png"),
            SKTexture(imageNamed: "morg10.png"),
            SKTexture(imageNamed: "morg11.png"),
            SKTexture(imageNamed: "morg12.png")]
        
        self.physicsWorld.contactDelegate = self
        createGame()
        createObjects()
        
    }
    
    func createObjects() {
        self.addChild(bgObject)
        self.addChild(groundObject)
        self.addChild(skyObject)
        self.addChild(wallObject)
        
        self.addChild(heroObject)
        self.addChild(carObject)
        self.addChild(dickObject)
        self.addChild(headObject)
       
        self.addChild(titleObject)
        self.addChild(dirtyRamObject)
        
        self.addChild(boomObject)
        self.addChild(backPersonObject)
    }
    
    func createGame() {
        
        flashAnimation(clr: .black, fromAplha: 1.0, toAplha: 0.0)
        
        onGroung = true
        onDeath = false
        gameVCBgidge.reloadButton.isHidden = true
        gameVCBgidge.reloadRamBg.isHidden = true
        gameVCBgidge.avtorButton.isHidden = true
        
        createBg()
        createGround()
        createSky()
        createWall()
        createHero()
        
        timerFuncIskDram(tim: timerAddIskDram, timInt: 3.5)
        timerFuncPovFasol(tim: timerAddPovFasol, timInt: 10.9)
        timerFuncDirtyRam(tim: timerAddDirtyRam, timInt: 18.3)
        timerFuncDick(tim: timerAddDick, timInt: 22)
        timerFuncAddGuys(tim: timerBackGuys, timInt: 25)
        timerFuncFlashWhite(tim: timerFlash, timInt: 29.3)
        timerFuncColorView(tim: timerColView, timInt: 30.1)
        timerFuncFlashWhite(tim: timerFlashTwo, timInt: 58.7)
        timerFuncColorView(tim: timerColViewTwo, timInt: 59.5)
        timerFuncFace(tim: timerFace, timInt: TimeInterval.random(in: 40...70))
        timerFuncFace(tim: timerFaceTwo, timInt: TimeInterval.random(in: 40...70))
        timerFuncSham(tim: timerSham, timInt: TimeInterval.random(in: 40...70))
        timerFuncSham(tim: timerShamTwo, timInt: TimeInterval.random(in: 40...70))
        timerFuncMorg(tim: timerMorg, timInt: TimeInterval.random(in: 40...70))
        timerFuncMorg(tim: timerMorgTwo, timInt: TimeInterval.random(in: 40...70))
        timerFuncCar(tim: timerCar, timInt: 33)
        timerFuncAddTable(tim: timerBackTable, timInt: 28)
        timerFuncAddSleep(tim: timerBackSleep, timInt: 30)
        timerFuncCar(tim: timerCarTwo, timInt: 88)
        timerFuncFlashWhite(tim: timerFlashThree, timInt: 102.5)
        timerFuncColorView(tim: timerColViewThree, timInt: 103.3)
        timerFuncFlashWhite(tim: timerFlashFour, timInt: 117)
        timerFuncColorView(tim: timerColViewFour, timInt: 117.8)
        timerFuncFlashBlack(tim: timerFlashFive, timInt: 146.1)
        timerFuncStopGame(tim: timerStopGame, timInt: 148)
    }
    
    func createBg() {
        
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
        sky.physicsBody?.categoryBitMask = wallGroup
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
            SKTexture(imageNamed: "hero1.png"),
            SKTexture(imageNamed: "hero2.png"),
            SKTexture(imageNamed: "hero3.png"),
            SKTexture(imageNamed: "hero4.png"),
            SKTexture(imageNamed: "hero5.png"),
            SKTexture(imageNamed: "hero6.png"),
            SKTexture(imageNamed: "hero7.png"),
            SKTexture(imageNamed: "hero8.png"),
            SKTexture(imageNamed: "hero9.png"),
            SKTexture(imageNamed: "hero10.png"),
            SKTexture(imageNamed: "hero11.png"),
            SKTexture(imageNamed: "hero12.png"),
            SKTexture(imageNamed: "hero13.png"),
            SKTexture(imageNamed: "hero14.png"),
            SKTexture(imageNamed: "hero15.png"),
            SKTexture(imageNamed: "hero16.png")]
        
        changeActionToRun()
        hero.position = position
        
        let moveBeginHero = SKAction.moveBy(x: -self.frame.size.width, y: 0 , duration: 25)
        hero.run(moveBeginHero)
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: (hero.size.width - 30),
                                                             height: hero.size.height))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | carGroup | wallGroup | faceGroup | shamGroup
        hero.physicsBody?.collisionBitMask = groundGroup | carGroup | wallGroup
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 5
        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4*5 , y: self.size.height/4))
    }
    
    
    func addDick() {
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
        
        dick.physicsBody?.isDynamic = false
        dick.physicsBody?.categoryBitMask = dickGroup
        dick.physicsBody?.collisionBitMask = heroGroup
        dick.physicsBody?.contactTestBitMask = heroGroup
        dick.zPosition = 2
        dickObject.addChild(dick)
    }
    
    func addTitle(txt: SKTexture) {
        
        title = SKSpriteNode(texture: txt)
        title.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        title.zPosition = 8
        titleObject.addChild(title)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.title.scale(to: CGSize(width: self.title.size.width * 1.2,
                                          height: self.title.size.height * 1.2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.title.scale(to: CGSize(width: self.title.size.width * 1.2,
                                              height: self.title.size.height * 1.2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.title.removeFromParent()
                }
            }
        }
    }
    
    func addHead(txt: SKTexture, txts: [SKTexture]) {
        face = SKSpriteNode(texture: txt)
        let faceAnimation = SKAction.animate(with: txts, timePerFrame: 0.07)
        let faceStart = SKAction.repeatForever(faceAnimation)
        face.run(faceStart)
        face.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: face.size.height, height: face.size.height))
        face.position = CGPoint(x: self.size.width * 1.1, y: self.size.height/4)
        let moveFace = SKAction.moveBy(x: -self.frame.size.width * 1.2, y: 0, duration: 4)
        let removeActionFace = SKAction.removeFromParent()
        let faceMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveFace, removeActionFace]))
        face.run(faceMoveBgForever)
        face.physicsBody?.isDynamic = true
        face.physicsBody?.categoryBitMask = faceGroup
        face.physicsBody?.collisionBitMask = groundGroup | heroGroup
        face.physicsBody?.contactTestBitMask = heroGroup
        face.zPosition = 5
        headObject.addChild(face)
    }
    
    func addBackPerson(txt: SKTexture) {
        let node = SKSpriteNode(texture: txt)
        node.position = CGPoint(x: self.size.width + 150, y: self.size.height / 2.5)
        let moveBackPerson = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 15)
        let removeBackPerson = SKAction.removeFromParent()
        let moveBackPersonForever = SKAction.repeatForever(SKAction.sequence([moveBackPerson, removeBackPerson]))
        node.run(moveBackPersonForever)
        node.zPosition = 2
        backPersonObject.addChild(node)
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
        car.physicsBody?.contactTestBitMask = groundGroup | heroGroup
        car.physicsBody?.collisionBitMask = groundGroup | heroGroup
        car.physicsBody?.isDynamic = false
        car.zPosition = 5
        carObject.addChild(car)
    }
    
    func flashAnimation (clr: UIColor, fromAplha: CGFloat, toAplha: CGFloat) {
        let aView = UIView(frame: self.view!.frame)
        aView.backgroundColor = clr
        aView.alpha = fromAplha
        self.view!.addSubview(aView)
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn, animations: {
            aView.alpha = toAplha
        }) { (done) in aView.removeFromSuperview()
        }
    }
    
    func shakeAndFlashAnimation(clr: UIColor) {
        //flash
        let aView = UIView(frame: self.view!.frame)
        aView.backgroundColor = clr
        self.view!.addSubview(aView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            aView.alpha = 0.0
        }) { (done) in aView.removeFromSuperview()
        }
        //Shake
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
        
        colorizedBack = SKSpriteNode(color: .green, size: CGSize(width: self.frame.size.width,
                                                                 height: self.frame.size.height))
        colorizedBack.position = CGPoint(x: self.frame.size.width/2,
                                         y: self.frame.size.height/2)
        colorizedBack.zPosition = 3
        colorizedBack.alpha = 0.1
        groundObject.addChild(colorizedBack)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            self.colorizedBack.color = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                self.colorizedBack.color = UIColor.blue
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                    self.colorizedBack.color = UIColor.green
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        self.colorizedBack.color = UIColor.red
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                            self.colorizedBack.color = UIColor.blue
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                                self.colorizedBack.removeFromParent()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func timerFuncDirtyRam(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                               repeats: false,
                                   block: { tim in self.addTitle(txt: self.dirtyRamTexture)})
    }
    
    func timerFuncIskDram(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                               repeats: false,
                                   block: { tim in self.addTitle(txt: self.iskDramTexture)})
    }
    
    func timerFuncPovFasol(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                               repeats: false,
                                   block: { tim in self.addTitle(txt: self.povFasolTexture)})
    }
    
        func timerFuncAddGuys(tim: Timer, timInt: TimeInterval) {
            var tim = Timer()
            tim.invalidate()
            tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                       block: { tim in self.addBackPerson(txt: self.guysTexture)})
        }
        
        func timerFuncAddTable(tim: Timer, timInt: TimeInterval) {
            var tim = Timer()
            tim.invalidate()
            tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                       repeats: false,
                                       block: { tim in self.addBackPerson(txt: self.tableTexture)})
        }
    
    func timerFuncAddSleep(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addBackPerson(txt: self.sleepTexture)})
    }
        
    func timerFuncDick(tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addDick()})
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
        
    func timerFuncFace (tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addHead(txt: self.faceTexture, txts: self.faceTextArr)})
    }
    
    func timerFuncSham (tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addHead(txt: self.shamTexture, txts: self.shamTextArr)})
    }
    
    func timerFuncMorg (tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addHead(txt: self.morgTexture, txts: self.morgTextArr)})
    }
    
    
    func timerFuncFlashWhite (tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.shakeAndFlashAnimation(clr: .white)})
    }
    
    func timerFuncFlashBlack (tim: Timer, timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.flashAnimation(clr: .black, fromAplha: 0.0, toAplha: 1.0)})
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
        
        func timerFuncStopGame(tim: Timer, timInt: TimeInterval) {
            var tim = Timer()
            tim.invalidate()
            tim = Timer.scheduledTimer(timeInterval: timInt,
                                       target: self,
                                       selector: #selector(GameScene.stopGame),
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
        
        func reloadGame() {
            scene?.isPaused = false
            SKTAudio.sharedInstance().playBackgroundMusic(filename: "toxin.mp3")
            createGame()
        }
        
        @objc func stopGame() {
            
            self.scene?.isPaused = true
            self.gameVCBgidge.reloadButton.isHidden = false
            self.gameVCBgidge.reloadRamBg.isHidden = false
            self.gameVCBgidge.avtorButton.isHidden = false
            
            stopAllTimers()
            SKTAudio.sharedInstance().pauseBackgroundMusic()
            
            heroObject.removeAllChildren()
            headObject.removeAllChildren()
            titleObject.removeAllChildren()
            carObject.removeAllChildren()
            dickObject.removeAllChildren()
            boomObject.removeAllChildren()
            wallObject.removeAllChildren()
            skyObject.removeAllChildren()
            groundObject.removeAllChildren()

//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {  }
        }
        
        func stopAllTimers() {
            timerAddDirtyRam.invalidate()
            timerAddIskDram.invalidate()
            timerAddPovFasol.invalidate()
            timerAddDick.invalidate()
            timerCar.invalidate()
            timerCarTwo.invalidate()
            timerAddPol.invalidate()
            timerFlash.invalidate()
            timerFlashTwo.invalidate()
            timerFlashThree.invalidate()
            timerFlashFour.invalidate()
            timerColView.invalidate()
            timerColViewTwo.invalidate()
            timerColViewThree.invalidate()
            timerColViewFour.invalidate()
            timerFace.invalidate()
            timerSham.invalidate()
            timerFaceTwo.invalidate()
            timerShamTwo.invalidate()
        }
        
}

