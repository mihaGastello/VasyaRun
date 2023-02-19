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
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 170))
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
        
        if contact.bodyA.categoryBitMask == headGroup || contact.bodyB.categoryBitMask == headGroup {
            head.physicsBody?.applyImpulse(CGVector(dx: 1000, dy: 100))
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
