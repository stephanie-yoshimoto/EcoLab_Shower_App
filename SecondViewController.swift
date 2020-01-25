//
//  SecondViewController.swift
//  TabBar2
//
//  Created by Rashmi Ananth on 1/25/20.
//  Copyright © 2020 Rashmi Ananth. All rights reserved.
//
import UIKit

struct Times {
    static var times = [Float]()
}

class SecondViewController: UIViewController {
    
    
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func save(_ sender: Any) {
        output.text = timeLabel.text
        
        UserDefaults.standard.set(timeLabel.text, forKey: "myShowerTimes")
    }
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var fractionsLabel: UILabel!
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func start(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(SecondViewController.keepTimer), userInfo: nil, repeats: true)
        
        startOutlet.isHidden = true
    }
    
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
        startOutlet.isHidden = false
    }
    
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        (hours, minutes, seconds, fractions) = (0, 0, 0, 0)
        timeLabel.text = "00:00:00"
        fractionsLabel.text = ".00"
        startOutlet.isHidden = false
    }
    
    
    
    @objc func keepTimer() {
        
        fractions += 1
        if (fractions > 99) {
            seconds += 1
            fractions = 0
        }
        if (seconds == 60) {
            minutes += 1
            seconds = 0
        }
        if (minutes == 60) {
            hours += 1
            minutes = 0
        }
        
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
        
        timeLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        fractionsLabel.text = ".\(fractions)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myShowerTimes") as? String {
            output.text = x
        }
    }
    
    
    
    
    
    
}
