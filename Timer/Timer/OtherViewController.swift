//
//  OtherViewController.swift
//  Timer
//
//  Created by akane.ota on 2019/03/12.
//  Copyright © 2019 akane.ota. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var fireButton: UIButton!
    @IBOutlet weak var steamButton: UIButton!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var waterMinLabel: UILabel!
    @IBOutlet weak var waterSecLabel: UILabel!
    @IBOutlet weak var fireMinLabel: UILabel!
    @IBOutlet weak var fireSecLabel: UILabel!
    @IBOutlet weak var steamMinLabel: UILabel!
    @IBOutlet weak var steamSecLabel: UILabel!
    @IBOutlet weak var setButton: UIButton!
    
    enum TimerType{
        case water
        case fire
        case steam
    }
    var userDefaults = UserDefaults.standard
    var timerType: TimerType = .water
    var waterTime = 1800
    var fireTime = 600
    var steamTime = 1200
    var minute = 0
    var second = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.delegate = self
        timePicker.dataSource = self
        
        timePicker.selectRow(10, inComponent: 0, animated: true)
        timePicker.selectRow(0, inComponent: 1, animated: true)
        
        waterButton.backgroundColor = UIColor(hex: "27B1FB")
        fireButton.backgroundColor = UIColor(hex: "FF4F97")
        steamButton.backgroundColor = UIColor(hex: "FFC707")
        
        if let time = userDefaults.object(forKey: "water"){
            waterTime = time as! Int
        }
        waterMinLabel.text = String(waterTime / 60)
        waterSecLabel.text = String(waterTime % 60)
        
        timePicker.backgroundColor = waterButton.backgroundColor
        self.view.backgroundColor = waterButton.backgroundColor
        setButton.backgroundColor = UIColor(hex: "bde7fe")
        
        timePicker.selectRow(waterTime / 60, inComponent: 0, animated: true)
        timePicker.selectRow(waterTime % 60, inComponent: 1, animated: true)
        
        second = waterTime % 60
        minute = waterTime - second
        
        if let time = userDefaults.object(forKey: "fire"){
            fireTime = time as! Int
        }
        fireMinLabel.text = String(fireTime / 60)
        fireSecLabel.text = String(fireTime % 60)
        
        if let time = userDefaults.object(forKey: "steam"){
            steamTime = time as! Int
        }
        steamMinLabel.text = String(steamTime / 60)
        steamSecLabel.text = String(steamTime % 60)
    }
    
    @IBAction func tappedTypeButton(_ sender: UIButton) {
        var setTime = 0
        if sender == waterButton {
            second = waterTime % 60
            minute = waterTime - second
            setTime = waterTime
            timePicker.backgroundColor = waterButton.backgroundColor
            self.view.backgroundColor = waterButton.backgroundColor
            setButton.backgroundColor = UIColor(hex: "bde7fe")
            timerType = .water
        } else if sender == fireButton {
            second = fireTime % 60
            minute = fireTime - second
            setTime = fireTime
            timePicker.backgroundColor = fireButton.backgroundColor
            self.view.backgroundColor = fireButton.backgroundColor
            setButton.backgroundColor = UIColor(hex: "ffd7e7")
            timerType = .fire
        } else if sender == steamButton {
            second = steamTime % 60
            minute = steamTime - second
            setTime = steamTime
            timePicker.backgroundColor = steamButton.backgroundColor
            self.view.backgroundColor = steamButton.backgroundColor
            setButton.backgroundColor = UIColor(hex: "fff5d3")
            timerType = .steam
        }
        timePicker.selectRow(setTime / 60, inComponent: 0, animated: true)
        timePicker.selectRow(setTime % 60, inComponent: 1, animated: true)
    }
    
    @IBAction func tappedSetTimeButton(_ sender: Any) {
        userDefaults.set(waterTime, forKey: "water")
        userDefaults.set(fireTime, forKey: "fire")
        userDefaults.set(steamTime, forKey: "steam")
        dismiss(animated: true, completion: nil)
    }
}

extension OtherViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        var setTime = 0
        
        if component == 0 {
            minute = row * 60
        } else if component == 1 {
            second = row
        }
        setTime = minute + second

        switch timerType {
        case .water:
            waterTime = setTime
            waterMinLabel.text = String(waterTime / 60)
            waterSecLabel.text = String(waterTime % 60)
            break
        case .fire:
            fireTime = setTime
            fireMinLabel.text = String(fireTime / 60)
            fireSecLabel.text = String(fireTime % 60)
            break
        case .steam:
            steamTime = setTime
            steamMinLabel.text = String(steamTime / 60)
            steamSecLabel.text = String(steamTime % 60)
            break
        }
    }
}
