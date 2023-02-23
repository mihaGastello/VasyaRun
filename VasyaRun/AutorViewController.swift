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
    @IBOutlet weak var insButton:UIButton!
    @IBOutlet weak var telButton:UIButton!
    @IBOutlet weak var tinButton:UIButton!
    @IBOutlet weak var emptyBg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeAutorView(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func pressInsButton(sender: UIButton) {
        guard let insUrl = URL(string: "instagram://user?username=MIHAILGASTELLO") else { return }
        UIApplication.shared.canOpenURL(insUrl)
        UIApplication.shared.open(insUrl, options: [:], completionHandler: nil)
    }
    
    @IBAction func pressTelButton(sender: UIButton) {
        guard let telUrl = URL(string: "https://t.me/mihailgastello") else { return }
        let telSafariVC = SFSafariViewController(url: telUrl)
        present(telSafariVC, animated: true, completion: nil)
    }
    
    @IBAction func pressTinButton(sender: UIButton) {
        guard let tinUrl = URL(string: "https://www.tinkoff.ru/cf/8aAoHrU32lZ") else { return }
        let tinSafariVC = SFSafariViewController(url: tinUrl)
        present(tinSafariVC, animated: true, completion: nil)
    }
}
