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

    @IBOutlet weak var reloadBG: UIView!
    @IBOutlet weak var reloadButton: UIButton!
    
    var scene = GameScene(size: CGSize(width: 1024, height: 768))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadButton.isHidden = true
        reloadBG.isHidden = true
        
        let view = self.view as! SKView?
        view?.ignoresSiblingOrder = true
        view?.showsFPS = true
        view?.showsNodeCount = true
        view?.showsPhysics = true
        scene.scaleMode = .resizeFill
        scene.gameVCBgidge = self
        view?.presentScene(scene)
        
    }

    @IBAction func reloadGameButton(sender: UIButton) {
        
        scene.reloadGame()
        reloadButton.isHidden = true
        reloadBG.isHidden = true
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
