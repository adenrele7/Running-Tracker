//
//  ViewController.swift
//  Running Tracker
//
//  Created by Make School on 7/26/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var startTimer: UIButton!

    @IBOutlet weak var stopTimer: UIButton!

    @IBOutlet weak var distanceField: UITextField!
    
    @IBOutlet weak var timeField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var restartButton: UIButton!

    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var time = 0.0
  
    var timer = Timer()
    
    var addLap: Bool = false
  
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    
    var isRunning =  false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        timeLabel.text = "\(time)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
    }

    func action(){
        time += 1
        timeLabel.text =  String(time)
        
    }
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
        time = 0
    }

    @IBAction func startTimerButton(_ sender: Any){
        
        if !isRunning{
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        }
        
    }
    
    func updateStopwatch(){
        
        fractions +=1
       
        if fractions == 100{
            seconds +=1
            fractions =0
        }
        
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        
      
        timer.invalidate()

        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        var cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")

        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap"
        cell.detailTextLabel?.text = "00:00:00"
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    }



