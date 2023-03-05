//
//  GameScene_Timers.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 04.03.23.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func timerFuncDirtyRam(timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addTitle(txt: self.dirtyRamTexture)})
    }
    
    func timerFuncIskDram(timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addTitle(txt: self.iskDramTexture)})
    }
    
    func timerFuncPovFasol(timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addTitle(txt: self.povFasolTexture)})
    }
    
        func timerFuncAddGuys(timInt: TimeInterval) {
            var tim = Timer()
            tim.invalidate()
            tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                       repeats: false,
                                       block: { tim in self.addBackPerson(txt: self.guysTexture)})
        }
        
        func timerFuncAddTable(timInt: TimeInterval) {
            var tim = Timer()
            tim.invalidate()
            tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                       repeats: false,
                                       block: { tim in self.addBackPerson(txt: self.tableTexture)})
        }
        
    func timerFuncDick(timInt: TimeInterval, dickPos: CGPoint, dickMove: CGPoint, dickDur: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addDick(startPos: CGPoint(x: dickPos.x, y: dickPos.y),
                                                                move: CGPoint(x: dickMove.x, y: dickMove.y),
                                                                dur: dickDur)})
    }
    
    func timerFuncCar(timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addCar()})
    }
        
    func timerFuncFace (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addFace(txt: self.faceTexture, txts: self.faceTextArr)})
    }
    
    func timerFuncSham (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addSham(txt: self.shamTexture, txts: self.shamTextArr)})
    }
    
    func timerFuncMorg (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.addMorg(txt: self.morgTexture, txts: self.morgTextArr)})
    }
    
    
    func timerFuncFlashWhite (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.shakeAndFlashAnimation(clr: .white)})
    }
    
    func timerFuncFlashBlack (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.flashAnimation(clr: .black, fromAplha: 0.0, toAplha: 1.0)})
    }
    
    func timerFuncColorView (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.changeBackgroundColor() })
    }
    
    func timerFuncStopGame (timInt: TimeInterval) {
        var tim = Timer()
        tim.invalidate()
        tim = Timer.scheduledTimer(withTimeInterval: timInt,
                                   repeats: false,
                                   block: { tim in self.stopGame() })
    }
    
}
