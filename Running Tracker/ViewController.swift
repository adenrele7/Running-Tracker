//
//  ViewController.swift
//  Running Tracker
//
//  Created by Make School on 7/26/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController  {

    private var startStopWatch: Bool = true
    private var addLap: Bool = false

    private var timer = Timer()
    
    private var minutes: Int = 0
    private var seconds: Int = 0
    private var fractions: Int = 0
    
    private var stopwatchString: String = ""
    var totalSec:Float = 0.0
    
    private var isRunning =  false
    
    @IBOutlet weak var startTimer: UIButton!

    @IBOutlet weak var stopTimer: UIButton!

    @IBOutlet weak var distanceField: UITextField!
    
    @IBOutlet weak var timeField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "00:00.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func action(){
        totalSec += 0.01
        timeLabel.text =  String(describing: time)
        
    }
    
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
        time = 0.0
        
    }

    @IBAction func startTimerButton(_ sender: Any){
        
        if !isRunning{
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        }
        
    }
    
    func updateStopwatch(){
        
        fractions += 1
        if fractions == 100{
           
            seconds += 1
            fractions = 0
        }
        if seconds == 60 {
           
            minutes += 1
            seconds = 0
        }
        let fractionsString = fractions > 9 ? " \(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        timeField.text = stopwatchString
        
    }
    
    
    
    @IBAction func stopTimer(_ sender: Any) {
        
      
        
        timer.invalidate()
        time = 0
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        
    }
   

}


