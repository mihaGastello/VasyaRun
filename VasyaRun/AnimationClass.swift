//
//  AnimationClass.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 08.01.23.
//

import Foundation
import SpriteKit

class AnimationClass {
    
    
    
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



