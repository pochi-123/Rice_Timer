//
//  SelectViewController.swift
//  Timer
//
//  Created by akane.ota on 2019/03/11.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    @IBOutlet weak var steamButton: UIButton!
    @IBOutlet weak var measureButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterButton.backgroundColor = UIColor(hex: "27B1FB")
        fireButton.backgroundColor = UIColor(hex: "FF4F97")
        steamButton.backgroundColor = UIColor(hex: "FFC707")
        measureButton.backgroundColor = UIColor(hex: "1EFB75")
        otherButton.backgroundColor = UIColor(hex: "FFFFFF")
    }

    @IBAction func tappedTimerButton(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        
        let timerView = self.storyboard?.instantiateViewController(withIdentifier: "TimerView") as! ViewController
        
        if sender == waterButton {
            if let time = userDefaults.object(forKey: "water"){
                timerView.setTime = time as! Int
            } else {
                timerView.setTime = 1800
            }
            timerView.timerType = .water
        } else if sender == fireButton {
            if let time = userDefaults.object(forKey: "fire"){
                timerView.setTime = time as! Int
            } else {
                timerView.setTime = 600
            }
            timerView.timerType = .fire
        } else if sender == steamButton {
            if let time = userDefaults.object(forKey: "steam"){
                timerView.setTime = time as! Int
            } else {
                timerView.setTime = 1200
            }
            timerView.timerType = .steam
        }
        present(timerView, animated: true, completion: nil )
    }
    
    @IBAction func tappedMeasureButton(_ sender: Any) {
        let measureView = self.storyboard?.instantiateViewController(withIdentifier: "MeasureView") as! MeasureViewController
        present(measureView, animated: true, completion: nil)
    }
    
    @IBAction func tappedOtherButton(_ sender: Any) {
        let otherView = self.storyboard?.instantiateViewController(withIdentifier: "OtherView") as! OtherViewController
        present(otherView, animated: true, completion: nil)
    }
}
