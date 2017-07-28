//
//  ViewController.swift
//  Running Tracker
//
//  Created by Make School on 7/26/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startTimer: UIButton!

    @IBOutlet weak var stopTimer: UIButton!

    @IBOutlet weak var distanceField: UITextField!
    
    @IBOutlet weak var timeField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "running_people_02.png")!)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }


    @IBAction func startTimerButton(_ sender: Any){
        
        
        
    }
    
    
    @IBAction func stopTimer(_ sender: Any) {
        
        
        
    }
    
}

