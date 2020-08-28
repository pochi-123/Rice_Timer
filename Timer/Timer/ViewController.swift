//
//  ViewController.swift
//  Timer
//
//  Created by akane.ota on 2019/03/11.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var timeLabels: [UILabel]!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopBuuton: UIButton!
    
    var setTime = 0
    var count = 0
    
    var timer: Timer!
    
    enum TimerType: String{
        case water = "WATER"
        case fire = "FIRE"
        case steam = "STEAM"
    }
    var timerType: TimerType = .water
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch timerType {
        case .water:
            titleLabel.text = "WATER"
            self.view.backgroundColor = UIColor(hex: "27b1fb")
            titleLabel.backgroundColor = UIColor(hex: "27b1fb")
            for timeLabel in timeLabels {
                timeLabel.backgroundColor = UIColor(hex: "6ac9fc")
            }
            resetButton.backgroundColor = UIColor(hex: "9cdbfd")
            backButton.backgroundColor = UIColor(hex: "9cdbfd")
            startButton.backgroundColor = UIColor(hex: "bde7fe")
            stopBuuton.backgroundColor = UIColor(hex: "bde7fe")
            break
        case .fire:
            titleLabel.text = "FIRE"
            self.view.backgroundColor = UIColor(hex: "FF4F97")
            titleLabel.backgroundColor = UIColor(hex: "FF4F97")
            for timeLabel in timeLabels {
                timeLabel.backgroundColor = UIColor(hex: "ff82b5")
            }
            backButton.backgroundColor = UIColor(hex: "ffb5d3")
            resetButton.backgroundColor = UIColor(hex: "ffb5d3")
            startButton.backgroundColor = UIColor(hex: "ffd7e7")
            stopBuuton.backgroundColor = UIColor(hex: "ffd7e7")
            break
        case .steam:
            titleLabel.text = "STEAM"
            self.view.backgroundColor = UIColor(hex: "ffcb18")
            titleLabel.backgroundColor = UIColor(hex: "ffcb18")
            for timeLabel in timeLabels {
                timeLabel.backgroundColor = UIColor(hex: "ffda5c")
            }
            backButton.backgroundColor = UIColor(hex: "ffe9a0")
            resetButton.backgroundColor = UIColor(hex: "ffe9a0")
            startButton.backgroundColor = UIColor(hex: "fff5d3")
            stopBuuton.backgroundColor = UIColor(hex: "fff5d3")
            break
        }
        
        startButton.isHidden = false
        stopBuuton.isHidden = true
        
        resetButton.isHidden = true
        backButton.isHidden = false
        
        count = setTime
        setTimeText()
    }
    
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerAction(sender:)),
                                     userInfo: true,
                                     repeats: true)
        timer.fire()
    }

    @objc func timerAction(sender: Timer) {
        setTimeText()
        if count == 0 {
            sender.invalidate()
        }
        count -= 1
    }
    
    func  setTimeText() {
        let minuteCount = count / 60
        minuteLabel.text = String(minuteCount)
        
        let secondCount = count % 60
        secondLabel.text = String(secondCount)
    }

    @IBAction func tappedStartButton(_ sender: Any) {
        createTimer()
        
        startButton.isHidden = true
        stopBuuton.isHidden = false
        
        resetButton.isHidden = false
        backButton.isHidden = true
    }
    
    @IBAction func tappedStopButton(_ sender: Any) {
        timer.invalidate()
        
        startButton.isHidden = false
        stopBuuton.isHidden = true
    }
    
    @IBAction func tappedResetButton(_ sender: Any) {
        timer.invalidate()
        timer = nil
        
        startButton.isHidden = false
        stopBuuton.isHidden = true
        
        resetButton.isHidden = true
        backButton.isHidden = false
        
        count = setTime
        setTimeText()
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


