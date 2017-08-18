//
//  ViewController.swift
//  Running Tracker
//
//  Created by Make School on 7/26/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData
import CoreMotion
import Foundation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate   {

    private var startStopWatch: Bool = true
    
    private var timer = Timer()
    
    private var momentTimerStarted: Date!
    
    private var seconds: Int = 0
    
    var totalSec:Float = 0.0

    private var hours: Int = 0

    private var miles: Int = 0
    
    private var distance = Measurement(value: 0, unit: UnitLength.meters)
    
    private var minutes: Int = 0

    private var fractions: Int = 0
    
    private var isRunning =  false
    
    
    private var currentLog: Log!
    
    let pedoMeter = CMPedometer()

    @IBOutlet weak var startTimer: UIButton!


    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!

    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var startDate: Date!
    var traveledDistance: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.distanceFilter = 10
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
            
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last ?? "none")
        if startDate == nil {
            startDate = Date()
        } else {
            print("elapsedTime:", String(format: "%.0fs", Date().timeIntervalSince(startDate)))
        }
        if startLocation == nil {
            startLocation = locations.first
        } else if let location = locations.last {
            traveledDistance += lastLocation.distance(from: location)
            print("Traveled Distance:",  traveledDistance)
            print("Straight Distance:", startLocation.distance(from: locations.last!))
        }
        lastLocation = locations.last
    }
    

    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        
    }

    func action(){
        
        momentTimerStarted = Date()
        
        let absoluteTime = abs(momentTimerStarted.timeIntervalSinceNow)
        
        totalSec += 0.01
        timeLabel.text =  String(totalSec)
        
        let formatter = MeasurementFormatter()
        
        let formattedDistance = FormatDisplay.distance(distance)
        
        formatter.string(from: distance)

        distanceLabel.text = String(formattedDistance)

    }
    private func updateStopWatch(){
        
        totalSec = totalSec + 0.1
        timeLabel.text = String(format: "%.1f", totalSec)
        
    }
    

    @IBAction func startTimerButton(_ sender: Any){
        
     //   if !isRunning{
            
      //  momentTimerStarted = Date()
            
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector              (ViewController.action), userInfo: nil, repeats: true)
           
            
            //distance = Measurement(value: 0.1, unit: UnitLength.meters)


      //  }
        
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        
        timer.invalidate()
        totalSec = 0
        timeLabel.text =  String(totalSec)

    }
    
        
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        currentLog = CoreDataHelper.createLog()
        currentLog.distance = Int16(Int(miles))
        currentLog.time = Int16(totalSec)
        
        CoreDataHelper.saveLog()
        
        do {
            
            timer.invalidate()
//            
            
        } catch let error as NSError {
          
            print("Could not save \(error)")
        
        }

        
    }
    
   
}




