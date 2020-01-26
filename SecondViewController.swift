//
//  SecondViewController.swift
//  TabBar2
//
//  Created by Rashmi Ananth on 1/25/20.
//  Copyright © 2020 Rashmi Ananth. All rights reserved.
//

import UIKit

struct Result {
    let time: String
    let date: String
}

extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
}

class SecondViewController: UIViewController {
    var timer = Timer()
    var (hours, minutes, seconds) = (0, 0, 0)
    let date = Date()
    var dateString = ""
    var time = ""
    var canStart = true
    var results: Array<Result> = Array()
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func save(_ sender: Any) {
        output.text = timeLabel.text
        UserDefaults.standard.set(timeLabel.text, forKey: "myShowerTimes")
        
        dateString = date.asString(style: .medium)
        time = output.text!
        
        results.insert(Result(time: time, date: dateString), at: 0)
        
        canStart = false
    }
    
    func getResults() -> Array<Result> {
        return results
    }

    @IBAction func start(_ sender: UIButton) {
        if canStart == false {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.keepTimer), userInfo: nil, repeats: true)
        
        startOutlet.isHidden = true
    }
    
    @IBAction func stop(_ sender: UIButton) {
        timer.invalidate()
        startOutlet.isHidden = false
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        timer.invalidate()
        timeLabel.text = "00:00:00"
        startOutlet.isHidden = false
    }
    
    @objc func keepTimer() {
        seconds += 1
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myShowerTimes") as? String {
            output.text = x
        }
    }
}
