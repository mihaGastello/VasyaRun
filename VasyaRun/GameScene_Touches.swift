//
//  GameScene_Touches.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if onGroung == true {
            onGroung = false
            hero.physicsBody?.velocity = CGVector.zero
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 450))
            changeActionToJump()
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == groundGroup || contact.bodyB.categoryBitMask == groundGroup {
            onGroung = true
            changeActionToRun()
        }
        
        if contact.bodyA.categoryBitMask == carGroup || contact.bodyB.categoryBitMask == carGroup {
            onGroung = true
            changeActionToRun()
        }
        
        if contact.bodyA.categoryBitMask == faceGroup || contact.bodyB.categoryBitMask == faceGroup {
            face.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 50))
            
            whiteBoom = SKSpriteNode(texture: whiteBoomTexture)
            whiteBoom.position = face.position
            whiteBoom.zPosition = 8
            boomObject.addChild(whiteBoom)

            let boomAnimation = SKAction.animate(with: whiteBoomTextArr, timePerFrame: 0.1)
            let boomRemove = SKAction.removeFromParent()
            let boomSequence = SKAction.sequence([boomAnimation, boomRemove])
            whiteBoom.run(boomSequence)
            
        }
        
        if contact.bodyA.categoryBitMask == shamGroup || contact.bodyB.categoryBitMask == shamGroup {
            sham.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 50))
            
            whiteBoom = SKSpriteNode(texture: whiteBoomTexture)
            whiteBoom.position = sham.position
            whiteBoom.zPosition = 8
            boomObject.addChild(whiteBoom)

            let boomAnimation = SKAction.animate(with: whiteBoomTextArr, timePerFrame: 0.1)
            let boomRemove = SKAction.removeFromParent()
            let boomSequence = SKAction.sequence([boomAnimation, boomRemove])
            whiteBoom.run(boomSequence)
        }
        
        if contact.bodyA.categoryBitMask == wallGroup || contact.bodyB.categoryBitMask == wallGroup {
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        }
        
    }
}
        
        
//        if contact.bodyA.categoryBitMask == backEnemyGroup || contact.bodyB.categoryBitMask == backEnemyGroup {
//
//            if sound == true {
//                run(deadSound)
//            }
//            animations.shakeAndFlashAnimation(view: self.view!)
//
//            hero.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//            frontEnemyObject.removeAllChildren()
//            backEnemyObject.removeAllChildren()
//            carObject.removeAllChildren()
//            bottleObject.removeAllChildren()
//
//            heroObject.speed = 0
//            frontEnemyObject.speed = 0
//            carObject.speed = 0
//            bottleObject.speed = 0
//            bgObject.speed = 0
//
//            timerAddPol.invalidate()
//            timerAddCar.invalidate()
//            timerAddBottle.invalidate()
//
//            changeActionToDeath()
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.heroObject.removeAllChildren()
//                self.backEnemyObject.removeAllChildren()
//                self.scene?.isPaused = true
//                self.gameVCBgidge.reloadBG.isHidden = false
//                self.gameVCBgidge.reloadButton.isHidden = false
//            }
//        }
//        if contact.bodyA.categoryBitMask == bottleGroup || contact.bodyB.categoryBitMask == bottleGroup {
//           let bottleNode = contact.bodyA.categoryBitMask == bottleGroup ? contact.bodyA.node : contact.bodyB.node
//
//           if sound == true { run(bottleSound) }
//
//           bottleNode?.removeFromParent()
//           hero.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 0))
//       }
//        if contact.bodyA.categoryBitMask == dickGroup || contact.bodyB.categoryBitMask == dickGroup {
//           let dickNode = contact.bodyA.categoryBitMask == dickGroup ? contact.bodyA.node : contact.bodyB.node
//
//           if sound == true { run(dickSound) }
//
//           dickNode?.removeFromParent()
//           hero.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 0))
//       }
