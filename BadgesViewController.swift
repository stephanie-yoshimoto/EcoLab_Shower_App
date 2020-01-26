//
//  BadgesViewController.swift
//  TabBar2
//
//  Created by Rashmi Ananth on 1/26/20.
//  Copyright © 2020 Rashmi Ananth. All rights reserved.
//

import UIKit

class BadgesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var starbucksButton: UIButton!
    @IBAction func showPopUp(_ sender: Any) {
        let alert = UIAlertController(title: "Reward of the Day", message: "Points necessary to unlock reward: 200 pts", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
