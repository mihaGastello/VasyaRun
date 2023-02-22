//
//  AutorViewController.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 22.02.23.
//

import Foundation
import UIKit
import SpriteKit

class AutorViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emptyBg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAutorView(sender: UIButton) {
        dismiss(animated: true)
    }
    
}
