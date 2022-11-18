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
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60))
            
            chnangeActionToJump()
        }
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == groundGroup || contact.bodyB.categoryBitMask == groundGroup {
            onGroung = true
            
            changeActionToRun()
        }
    }
}
