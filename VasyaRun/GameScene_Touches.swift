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
            hero.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 270))
            changeActionToJump()
        }
        if greetingLabel.isHidden == false {
            greetingLabel.isHidden = true
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
            face.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 40))
            hero.physicsBody?.applyImpulse(CGVector(dx: -45, dy: 0))
            showBoom(txt: whiteBoomTexture, txts: whiteBoomTextArr, node: face)
        }
        
        if contact.bodyA.categoryBitMask == shamGroup || contact.bodyB.categoryBitMask == shamGroup {
            sham.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 150))
            hero.physicsBody?.applyImpulse(CGVector(dx: -45, dy: 0))
            showBoom(txt: whiteBoomTexture, txts: whiteBoomTextArr, node: sham)
        }
        
        if contact.bodyA.categoryBitMask == morgGroup || contact.bodyB.categoryBitMask == morgGroup {
            morg.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 300))
            hero.physicsBody?.applyImpulse(CGVector(dx: -45, dy: 0))
            showBoom(txt: whiteBoomTexture, txts: whiteBoomTextArr, node: morg)
        }
        
        if contact.bodyA.categoryBitMask == wallGroup || contact.bodyB.categoryBitMask == wallGroup {
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 200))
        }
        
        if contact.bodyA.categoryBitMask == dickGroup || contact.bodyB.categoryBitMask == dickGroup {
            let dickNode = contact.bodyA.categoryBitMask == dickGroup ? contact.bodyA.node : contact.bodyB.node
            dickNode?.removeFromParent()
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 90))
            showBoom(txt: redBoomTexture, txts: redBoomTextArr, node: dick)
       }
    }
}
        


