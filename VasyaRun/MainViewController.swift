//
//  MainViewController.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 13.02.23.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func startGame(sender: UIButton) {
        if let storyboard = storyboard {
            let gameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
            navigationController?.pushViewController(gameViewController, animated: true)
        }
        SKTAudio.sharedInstance().playBackgroundMusic(filename: "toxin.mp3")
    }
    
    func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
