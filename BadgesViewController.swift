//
//  BadgesController.swift
//  TabBar2
//
//  Created by Stephanie Yoshimoto on 1/26/20.
//  Copyright © 2020 Rashmi Ananth. All rights reserved.
//

import Foundation
import UIKit

class BadgesController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Rewards", message: "Points necessary to unlock reward: 200 pts", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
