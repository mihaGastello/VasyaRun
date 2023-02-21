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
            hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 320))
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
            face.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 40))
            
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
            sham.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 80))
            
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
        
        if contact.bodyA.categoryBitMask == dickGroup || contact.bodyB.categoryBitMask == dickGroup {
           let dickNode = contact.bodyA.categoryBitMask == dickGroup ? contact.bodyA.node : contact.bodyB.node
           dickNode?.removeFromParent()
           hero.physicsBody?.applyImpulse(CGVector(dx: -50, dy: 0))
            
            whiteBoom = SKSpriteNode(texture: whiteBoomTexture)
            whiteBoom.position = hero.position
            whiteBoom.zPosition = 8
            boomObject.addChild(whiteBoom)

            let boomAnimation = SKAction.animate(with: whiteBoomTextArr, timePerFrame: 0.1)
            let boomRemove = SKAction.removeFromParent()
            let boomSequence = SKAction.sequence([boomAnimation, boomRemove])
            whiteBoom.run(boomSequence)
       }
    }
}
        


