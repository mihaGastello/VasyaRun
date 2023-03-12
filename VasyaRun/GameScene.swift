//
//  GameScene.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //var animations = AnimationClass()
    var sound = true
    var onGroung = true
    var onDeath = false
    var gameVCBgidge: GameViewController!
    var mainVCBridge: MainViewController!
    
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
    var redBoomTexture: SKTexture!
    var guysTexture: SKTexture!
    var sleepTexture: SKTexture!
    var tableTexture: SKTexture!
    var baner1Texture: SKTexture!
    var baner2Texture: SKTexture!
    var baner3Texture: SKTexture!
    var baner4Texture: SKTexture!
    var koTexture: SKTexture!
    var boyTexture: SKTexture!
    
    // LabelNodes
    var greetingLabel = SKLabelNode()
    
    // SpriteNodes
    var dirtyRam = SKSpriteNode()
    var povFasol = SKSpriteNode()
    var iskDram = SKSpriteNode()
    var title = SKSpriteNode()
    var bg = SKSpriteNode()
    var ground = SKSpriteNode()
    var sky = SKSpriteNode()
    var wall = SKSpriteNode()
    var wallForward = SKSpriteNode()
    var hero = SKSpriteNode()
    var car = SKSpriteNode()
    var face = SKSpriteNode()
    var sham = SKSpriteNode()
    var morg = SKSpriteNode()
    var dick = SKSpriteNode()
    var colorizedBack = SKSpriteNode()
    var whiteBoom = SKSpriteNode()
    var redBoom = SKSpriteNode()
    var guys = SKSpriteNode()
    var sleep = SKSpriteNode()
    var table = SKSpriteNode()
    var ko = SKSpriteNode()
    var boy = SKSpriteNode()
    
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
    var dickObject = SKNode()
    var boomObject = SKNode()
    var backPersonObject = SKNode()
    var labelObject = SKNode()
    
    // Bit masks
    var heroGroup: UInt32 = 0x1 << 1
    var groundGroup: UInt32 = 0x1 << 2
    var carGroup: UInt32 = 0x1 << 3
    var faceGroup: UInt32 = 0x1 << 4
    var shamGroup: UInt32 = 0x1 << 5
    var morgGroup: UInt32 = 0x1 << 6
    var dickGroup: UInt32 = 0x1 << 7
    var wallGroup: UInt32 = 0x1 << 8
    
    // Array textures for animate
    var heroRunTextArr = [SKTexture]()
    var heroJumpTextArr = [SKTexture]()
    var carTextArr = [SKTexture]()
    var heroDeadTextArr = [SKTexture]()
    var faceTextArr = [SKTexture]()
    var shamTextArr = [SKTexture]()
    var morgTextArr = [SKTexture]()
    var whiteBoomTextArr = [SKTexture]()
    var redBoomTextArr = [SKTexture]()
    var boyTextArr = [SKTexture]()
    
    override func didMove(to view: SKView) {
        
        guysTexture = SKTexture(imageNamed: "guys.png")
        tableTexture = SKTexture(imageNamed: "table.png")
        baner1Texture = SKTexture(imageNamed: "banner1.png")
        baner2Texture = SKTexture(imageNamed: "banner2.png")
        baner3Texture = SKTexture(imageNamed: "banner3.png")
        baner4Texture = SKTexture(imageNamed: "banner4.png")
        koTexture = SKTexture(imageNamed: "ko.png")
        boyTexture = SKTexture(imageNamed: "boy1.png")
        
        dirtyRamTexture = SKTexture(imageNamed: "dirtyRam.png")
        iskDramTexture = SKTexture(imageNamed: "iskDram.png")
        povFasolTexture = SKTexture(imageNamed: "povFasol.png")
        runHeroTexture = SKTexture(imageNamed: "hero14.png")
        jumpHeroTexture = SKTexture(imageNamed: "hero14.png")
        bgTexture = SKTexture(imageNamed: "bg7.jpg")
        carTexture = SKTexture(imageNamed: "car1.png")
        dickTexture = SKTexture(imageNamed: "dick1.png")
        
        faceTexture = SKTexture(imageNamed: "face1.png")
        shamTexture = SKTexture(imageNamed: "sham1.png")
        morgTexture = SKTexture(imageNamed: "morg1.png")
        
        heroJumpTextArr = [SKTexture(imageNamed: "hero14.png")]
        whiteBoomTexture = SKTexture(imageNamed: "cloud200.png")
        redBoomTexture = SKTexture(imageNamed: "boom200.png")
        
        whiteBoomTextArr = [
            SKTexture(imageNamed: "cloud200.png"),
            SKTexture(imageNamed: "cloud400.png")]
        
        redBoomTextArr = [
            SKTexture(imageNamed: "boom200.png"),
            SKTexture(imageNamed: "boom400.png")]
        
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
        
        boyTextArr = [
            SKTexture(imageNamed: "boy1.png"),
            SKTexture(imageNamed: "boy2.png"),
            SKTexture(imageNamed: "boy3.png"),
            SKTexture(imageNamed: "boy4.png"),
            SKTexture(imageNamed: "boy5.png"),
            SKTexture(imageNamed: "boy6.png"),
            SKTexture(imageNamed: "boy7.png"),
            SKTexture(imageNamed: "boy8.png"),
            SKTexture(imageNamed: "boy9.png"),
            SKTexture(imageNamed: "boy10.png"),
            SKTexture(imageNamed: "boy11.png"),
            SKTexture(imageNamed: "boy12.png"),
            SKTexture(imageNamed: "boy13.png"),
            SKTexture(imageNamed: "boy14.png"),
            SKTexture(imageNamed: "boy15.png"),
            SKTexture(imageNamed: "boy16.png"),
            SKTexture(imageNamed: "boy17.png"),
            SKTexture(imageNamed: "boy18.png"),
            SKTexture(imageNamed: "boy19.png"),
            SKTexture(imageNamed: "boy20.png"),
            SKTexture(imageNamed: "boy21.png"),
            SKTexture(imageNamed: "boy22.png"),
            SKTexture(imageNamed: "boy23.png"),
            SKTexture(imageNamed: "boy24.png"),
            SKTexture(imageNamed: "boy25.png")]
        
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
        self.addChild(labelObject)
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
        showGreeting()

        //VSTUPLENIE
        timerFuncTitle(timInt: 3.5, titleTexture: iskDramTexture)
        timerFuncTitle(timInt: 10.9, titleTexture: povFasolTexture)
        timerFuncTitle(timInt: 18.3, titleTexture: dirtyRamTexture)
        
        // KUPLET
        timerFuncFlashWhite(timInt: 29.3)
        timerFuncColorView(timInt: 30.1)
        timerFuncBack(timInt: 29, txtBack: tableTexture, heightBack: self.size.height / 3)
        timerFuncBack(timInt: 36, txtBack: baner1Texture, heightBack: self.size.height / 2.4)
        timerFuncFace(timInt: 30)
        timerFuncMorg(timInt: 32)
        timerFuncSham(timInt: 33)
        timerFuncFace(timInt: 35)
        timerFuncSham(timInt: 38)
        timerFuncMorg(timInt: 39)
        timerFuncFace(timInt: 45)
        timerFuncMorg(timInt: 47)
        timerFuncSham(timInt: 48)
        timerFuncFace(timInt: 54)
        timerFuncCar(timInt: 45)
        timerFuncKo(timInt: 57)
        
        //PRIPEV
        timerFuncFlashWhite(timInt: 58.7)
        timerFuncColorView(timInt: 59.5)
        timerFuncDick(timInt: 62, dickPos: CGPoint(x: self.frame.width * -0.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: 1500, y: -400), dickDur: 3)
        timerFuncBack(timInt: 63, txtBack: guysTexture, heightBack: self.size.height / 3)
        timerFuncDick(timInt: 67, dickPos: CGPoint(x: self.frame.width * 1.2, y: self.frame.height / 3), dickMove: CGPoint(x: -1500, y: 50), dickDur: 4)
        timerFuncDick(timInt: 69, dickPos: CGPoint(x: self.frame.width * -0.2, y: self.frame.height / 3), dickMove: CGPoint(x: 1500, y: 100), dickDur: 3)
        timerFuncDick(timInt: 71, dickPos: CGPoint(x: self.frame.width * 1.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: -1500, y: -500), dickDur: 4)
        timerFuncDick(timInt: 71, dickPos: CGPoint(x: self.frame.width * 1.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: -1500, y: -500), dickDur: 4)
        
        // PRIPEV DEGA
        timerFuncFlashWhite(timInt: 73)
        timerFuncColorView(timInt: 73.8)
        timerFuncBack(timInt: 75, txtBack: baner2Texture, heightBack: self.size.height / 2.4)
        
        // KUPLET
        timerFuncCar(timInt: 87)
        timerFuncSham(timInt: 84.5)
        timerFuncFace(timInt: 85.5)
        timerFuncSham(timInt: 89)
        timerFuncFace(timInt: 92)
        timerFuncMorg(timInt: 93)
        timerFuncSham(timInt: 96)
        timerFuncMorg(timInt: 98)

        //KUPLET PRODOLZHENIE
        timerFuncFlashWhite(timInt: 102.5)
        timerFuncBoy(timInt: 103)
        timerFuncColorView(timInt: 103.3)
        timerFuncBack(timInt: 105, txtBack: baner3Texture, heightBack: self.size.height / 2.4)
        
        // PRIPEV
        timerFuncFlashWhite(timInt: 117)
        timerFuncColorView(timInt: 117.8)
        
        timerFuncDick(timInt: 119, dickPos: CGPoint(x: self.frame.width * -0.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: 1500, y: -400), dickDur: 3)
        timerFuncDick(timInt: 121, dickPos: CGPoint(x: self.frame.width * 1.2, y: self.frame.height / 3), dickMove: CGPoint(x: -1500, y: 50), dickDur: 4)
        timerFuncDick(timInt: 125, dickPos: CGPoint(x: self.frame.width * -0.2, y: self.frame.height / 3), dickMove: CGPoint(x: 1500, y: 100), dickDur: 3)
        timerFuncDick(timInt: 126, dickPos: CGPoint(x: self.frame.width * 1.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: -1500, y: -500), dickDur: 4)
        timerFuncDick(timInt: 130, dickPos: CGPoint(x: self.frame.width * -0.2, y: self.frame.height * 1.2), dickMove: CGPoint(x: 1500, y: -400), dickDur: 3)
        
        timerFuncBack(timInt: 131, txtBack: baner4Texture, heightBack: self.size.height / 2.4)
        
        timerFuncFlashBlack(timInt: 146.1)
        timerFuncStopGame(timInt: 148)
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
            bgObject.addChild(bg)
        }
    }
    
    func createGround() {
        ground.position = CGPoint.zero
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width * 3, height: self.frame.height/7))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = groundGroup
        groundObject.addChild(ground)
    }
    
    func createSky() {
        sky = SKSpriteNode()
        sky.position = CGPoint(x: 0, y: self.frame.maxY)
        sky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width * 3,
                                                            height: self.frame.size.height / 6))
        sky.physicsBody?.isDynamic = false
        sky.physicsBody?.categoryBitMask = wallGroup
        skyObject.addChild(sky)
    }
    
    func createWall() {
        wall = SKSpriteNode()
        wall.position = CGPoint(x: self.frame.minX, y: 0)
        wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width / 8,
                                                             height: self.frame.size.height * 2))
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.categoryBitMask = wallGroup
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
        hero.run(SKAction.moveBy(x: -self.frame.size.width, y: 0 , duration: 25))
        
        hero.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: (hero.size.width - 40),
                                                             height: hero.size.height))
        hero.physicsBody?.categoryBitMask = heroGroup
        hero.physicsBody?.contactTestBitMask = groundGroup | carGroup | wallGroup | faceGroup | shamGroup
        hero.physicsBody?.collisionBitMask = groundGroup | carGroup | wallGroup
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.allowsRotation = false
        hero.zPosition = 8
        heroObject.addChild(hero)
    }
    
    func createHero() {
        addHero(heroNode: hero, atPosition: CGPoint(x: self.size.width/4*5 , y: self.size.height/4))
    }
    
    func addDick(startPos: CGPoint, move: CGPoint, dur: TimeInterval) {
        dick = SKSpriteNode(texture: dickTexture)
        dick.run(SKAction.repeatForever(SKAction.rotate(byAngle: 150, duration: 10)))
        
        dick.position = CGPoint(x: startPos.x, y: startPos.y)
        dick.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: dick.size.width - 10,
                                                             height: dick.size.height - 10))
        dick.physicsBody?.restitution = 0

        let moveDick = SKAction.moveBy(x: move.x, y: move.y, duration: dur)
        let removeAction = SKAction.removeFromParent()
        dick.run(SKAction.repeatForever(SKAction.sequence([moveDick, removeAction])))
        
        dick.physicsBody?.isDynamic = false
        dick.physicsBody?.categoryBitMask = dickGroup
        dick.physicsBody?.collisionBitMask = heroGroup
        dick.physicsBody?.contactTestBitMask = heroGroup
        dick.zPosition = 7
        dickObject.addChild(dick)
    }
    
    func addFace(txt: SKTexture, txts: [SKTexture]) {
        
        face = SKSpriteNode(texture: txt)
        face.run(SKAction.repeatForever(SKAction.animate(with: txts, timePerFrame: 0.07)))

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
        face.zPosition = 6
        headObject.addChild(face)
    }
    
    func addMorg(txt: SKTexture, txts: [SKTexture]) {
        
        morg = SKSpriteNode(texture: txt)
        morg.run(SKAction.repeatForever(SKAction.animate(with: txts, timePerFrame: 0.07)))
        
        morg.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: morg.size.height, height: morg.size.height))
        morg.position = CGPoint(x: self.size.width * 1.1, y: self.size.height/4)
        let moveFace = SKAction.moveBy(x: -self.frame.size.width * 1.2, y: 0, duration: 4)
        let removeActionFace = SKAction.removeFromParent()
        let faceMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveFace, removeActionFace]))
        morg.run(faceMoveBgForever)
        morg.physicsBody?.isDynamic = true
        morg.physicsBody?.categoryBitMask = morgGroup
        morg.physicsBody?.collisionBitMask = groundGroup | heroGroup
        morg.physicsBody?.contactTestBitMask = heroGroup
        morg.zPosition = 4
        headObject.addChild(morg)
    }
    
    func addSham(txt: SKTexture, txts: [SKTexture]) {
        
        sham = SKSpriteNode(texture: txt)
        sham.run(SKAction.repeatForever(SKAction.animate(with: txts, timePerFrame: 0.07)))
        
        sham.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: sham.size.height, height: sham.size.height))
        sham.position = CGPoint(x: self.size.width * 1.1, y: self.size.height/4)
        let moveFace = SKAction.moveBy(x: -self.frame.size.width * 1.2, y: 0, duration: 4)
        let removeActionFace = SKAction.removeFromParent()
        let faceMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveFace, removeActionFace]))
        sham.run(faceMoveBgForever)
        sham.physicsBody?.isDynamic = true
        sham.physicsBody?.categoryBitMask = shamGroup
        sham.physicsBody?.collisionBitMask = groundGroup | heroGroup
        sham.physicsBody?.contactTestBitMask = heroGroup
        sham.zPosition = 5
        headObject.addChild(sham)
    }
    
    func addBackPerson(txt: SKTexture, height: CGFloat) {
        let node = SKSpriteNode(texture: txt)
        node.position = CGPoint(x: self.size.width * 1.5, y: height)
        let moveBackPerson = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 15)
        let removeBackPerson = SKAction.removeFromParent()
        let moveBackPersonForever = SKAction.repeatForever(SKAction.sequence([moveBackPerson, removeBackPerson]))
        node.run(moveBackPersonForever)
        node.zPosition = 2
        backPersonObject.addChild(node)
    }
    
    func addCar() {
        car = SKSpriteNode(texture: carTexture)
        car.run(SKAction.repeatForever(SKAction.animate(with: carTextArr, timePerFrame: 2)))

        car.physicsBody = SKPhysicsBody(texture: carTexture,
                                        size: CGSize(width: carTexture.size().width, height: carTexture.size().height))
        car.position = CGPoint(x: self.size.width * 1.3, y: self.size.height / 4)
        let moveCar = SKAction.moveBy(x: -self.frame.size.width * 2, y: 0, duration: 15)
        let removeActionCar = SKAction.removeFromParent()
        let carMoveBgForever = SKAction.repeatForever(SKAction.sequence([moveCar, removeActionCar]))
        car.run(carMoveBgForever)
        car.physicsBody?.categoryBitMask = carGroup
        car.physicsBody?.contactTestBitMask = groundGroup | heroGroup
        car.physicsBody?.collisionBitMask = groundGroup | heroGroup
        car.physicsBody?.isDynamic = false
        car.zPosition = 3
        carObject.addChild(car)
    }
    
        func changeActionToJump() {
            hero.run(SKAction.repeatForever(SKAction.animate(with: heroJumpTextArr, timePerFrame: 1)))
        }
        
        func changeActionToRun() {
            hero.run(SKAction.repeatForever(SKAction.animate(with: heroRunTextArr, timePerFrame: 0.1)))
        }
        
        func reloadGame() {
            scene?.isPaused = false
            SKTAudio.sharedInstance().playBackgroundMusic(filename: "toxin.mp3")
            createGame()
        }
        
    func showGreeting() {
        greetingLabel.text = "Эй ганстер, для прыжка жми на экран!"
        greetingLabel.position = CGPoint(x: self.frame.midX, y: 16)
        greetingLabel.fontSize = 25
        greetingLabel.zPosition = 11
        greetingLabel.isHidden = false
        labelObject.addChild(greetingLabel)
    }
    
        func stopGame() {
            self.scene?.isPaused = true
            self.gameVCBgidge.reloadButton.isHidden = false
            self.gameVCBgidge.reloadRamBg.isHidden = false
            self.gameVCBgidge.avtorButton.isHidden = false

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
            labelObject.removeAllChildren()
        }
        
}

