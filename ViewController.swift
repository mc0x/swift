//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var readTimer: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var secondsLeft:Int = 60

    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        secondsLeft = eggTimes[hardness]!
       // print(eggTimes[hardness]!)
        
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
  
        
//        switch hardness{
//        case ("Soft"):
//            print(eggTimes["Soft"]!)
//        case ("Medium"):
//            print(eggTimes["Medium"]!)
//        case ("Hard"):
//            print(eggTimes["Hard"]!)
//        default:
//            print("Error")
//        }

    }

    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
         
            secondsLeft -= 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            readTimer.text = String(secondsLeft)
            
        }else{
            timer.invalidate()
            readTimer.text = "Ready!"
            titleLabel.text = "Done!"
        }
    }
    
}
