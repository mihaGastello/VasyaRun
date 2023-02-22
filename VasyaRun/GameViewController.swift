//
//  GameViewController.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 17.11.22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var avtorButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var reloadRamBg: UIImageView!
    
    var scene = GameScene(size: CGSize(width: 1024, height: 768))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadButton.isHidden = true
        reloadRamBg.isHidden = true
        avtorButton.isHidden = true
        exitButton.isHidden = true
       
        let view = self.view as! SKView?
        view?.ignoresSiblingOrder = true
        view?.showsFPS = true
        view?.showsNodeCount = true
        view?.showsPhysics = true
        scene.scaleMode = .resizeFill
        scene.gameVCBgidge = self
        view?.presentScene(scene)
    }
    
    @IBAction func toAvtorInfo(sender: UIButton) {
    }
    
    @IBAction func exitFromApp(sender: UIButton) {
    }

    @IBAction func reloadGameButton(sender: UIButton) {
        scene.reloadGame()
        reloadButton.isHidden = true
        reloadRamBg.isHidden = true
        avtorButton.isHidden = true
        exitButton.isHidden = true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
