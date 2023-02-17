//
//  AnimationClass.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 08.01.23.
//

import Foundation
import SpriteKit

class AnimationClass {
    
    func shakeAndFlashAnimation(view: SKView) {
        //White flash
        let aView = UIView(frame: view.frame)
        aView.backgroundColor = UIColor.white
        view.addSubview(aView)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            aView.alpha = 0.0
            }) { (done) in
                aView.removeFromSuperview()
        }
        
        //Shake animation
        let shake = CAKeyframeAnimation(keyPath: "transform")
        shake.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(-15, 5, 5)),
            NSValue(caTransform3D: CATransform3DMakeTranslation(15, 5, 5))
        ]
        shake.autoreverses = true
        shake.repeatCount = 2
        shake.duration = 7/100
        view.layer.add(shake, forKey: nil)
    }
    
    func changeBackgroundColor(view: SKView) {
        let aView = UIView(frame: view.frame)
        aView.layer.zPosition = 0
        aView.backgroundColor = UIColor.green
        view.addSubview(aView)
        aView.alpha = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            aView.backgroundColor = UIColor.red
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                aView.backgroundColor = UIColor.blue
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    aView.removeFromSuperview()
                }
            }
        }
    }
}



