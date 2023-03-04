//
//  AutorViewController.swift
//  VasyaRun
//
//  Created by Kisluhin Mihail on 22.02.23.
//

import Foundation
import UIKit
import SpriteKit
import SafariServices

class AutorViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var telButton:UIButton!
    @IBOutlet weak var emptyBg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAutorView(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func pressTelButton(sender: UIButton) {
        guard let tapUrl = URL(string: "https://taplink.cc/mihailgastello") else { return }
        let tapSafariVC = SFSafariViewController(url: tapUrl)
        present(tapSafariVC, animated: true, completion: nil)
    }
}
