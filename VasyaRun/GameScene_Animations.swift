//
//  GameScene_Animations.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 04.03.23.
//

import Foundation
import SpriteKit

extension GameScene {
    
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
    
    func showBoom (txt: SKTexture, txts: [SKTexture], node: SKSpriteNode) {
        var boom = SKSpriteNode()
        boom = SKSpriteNode(texture: txt)
        boom.position = node.position
        boom.zPosition = 10
        boomObject.addChild(boom)

        let boomAnimation = SKAction.animate(with: txts, timePerFrame: 0.1)
        let boomRemove = SKAction.removeFromParent()
        let boomSequence = SKAction.sequence([boomAnimation, boomRemove])
        boom.run(boomSequence)
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
    
    func changeBackgroundColor() {
        
        colorizedBack = SKSpriteNode(color: .green, size: CGSize(width: self.frame.size.width,
                                                                 height: self.frame.size.height))
        colorizedBack.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        colorizedBack.zPosition = 1
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
    
    func addTitle(txt: SKTexture) {
        
        title = SKSpriteNode(texture: txt)
        title.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        title.zPosition = 9
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
    
    func addKo() {
        ko = SKSpriteNode(texture: koTexture)
        ko.position = CGPoint(x: -self.frame.width*2, y: self.frame.height / 2)
        let moveKo = SKAction.moveBy(x: self.frame.size.width * 6, y: 0, duration: 1.8)
        let removeKo = SKAction.removeFromParent()
        let moveKoForever = SKAction.repeatForever(SKAction.sequence([moveKo, removeKo]))
        ko.run(moveKoForever)
        ko.zPosition = 9
        titleObject.addChild(ko)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.ko.removeFromParent()
        }
    }
    
    func addBoy() {
        boy = SKSpriteNode(texture: boyTexture)
        boy.anchorPoint = CGPoint(x: 0, y: 0)
        boy.position = CGPoint(x: self.frame.width / 2, y: 0)
        boy.zPosition = 9
        titleObject.addChild(boy)
        boy.run(SKAction.repeatForever(SKAction.animate(with: boyTextArr, timePerFrame: 0.1)))
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            self.boy.removeFromParent()
        }
    }
}
