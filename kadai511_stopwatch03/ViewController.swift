//
//  ViewController.swift
//  kadai511_stopwatch03
//
//  Created by 高橋聡一郎 on 2019/05/17.
//  Copyright © 2019 SOU24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var timerMinute: UILabel!
    
    
    @IBOutlet weak var timerSecond: UILabel!
    
    
    @IBOutlet weak var timerMiniSecond: UILabel!
    
    weak var timer: Timer!
    var startTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   print("aaaaaa")
    }


    @IBAction func startTimer(_ sender: Any) {
        
        if timer != nil{
            
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector( self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
    }
    

    @IBAction func stopTimer(_ sender: Any) {
    
        if timer != nil{
            timer.invalidate()
            
            timerMinute.text = "00"
            timerSecond.text = "00"
            timerMiniSecond.text = "00"
    
    
    }
    
}
    @objc func timerCounter() {
        
        let currentTime = Date().timeIntervalSince(startTime)
        
        
        let minute = (Int)(fmod((currentTime/60), 60))
    
        let second = (Int)(fmod(currentTime, 60))
        
        let msec = (Int)((currentTime - floor(currentTime))*100)
        
    
        let sMinute = String(format:"%02d", minute)
        let sSecond = String(format:"%02d", second)
        let sMsec = String(format:"%02d", msec)
        
        timerMinute.text = sMinute
        timerSecond.text = sSecond
        timerMiniSecond.text = sMsec
        
}
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
    
    




