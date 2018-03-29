//
//  ViewController.swift
//  Bully'sEye
//
//  Created by Saivishal Gummadi on 3/25/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController
{
    var currentValue = 0
    var targetValue = 0
    var trackingRounds = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var trackingRoundLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
       reStartTheGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let inserts = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: inserts)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: inserts)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   @IBAction func reStartTheGame() {
        trackingRounds = 0
    score = 0
    startNewRound()
    }
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        trackingRoundLabel.text = String(trackingRounds)
        ScoreLabel.text = String(score)
    }
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value  = Float(currentValue)
        trackingRounds += 1
        updateLabels()
        
    }
    @IBAction func sliderMoved (_ slider: UISlider) {
        print("the value of slider: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    @IBAction func showAlert() {
        
        let difference: Int = abs(currentValue - targetValue)
        var points  = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1{
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close..."
        }
        score += points
        let message = "You score is: \(score)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        //        var difference: Int  = currentValue - targetValue   //(second way of writting )
        //        if difference < 0 {
        //            //difference = difference * -1 //(one way of writting )
        //            //difference *= -1 //(second way of writting )
        //            difference = -difference
        //        }
        //        var difference: Int //(one way of writting )
        //        if targetValue > currentValue {
        //            difference = targetValue - currentValue
        //        } else if currentValue > targetValue {
        //            difference = currentValue - targetValue
        //        } else {
        //            difference = 0
        //        }
        
        //        let message = "The value of slider is: \(currentValue)" +
        //            "\nThe target value of slider is: \(targetValue)" +
        //        "\nThe difference of target value is: \(difference)"
        
    }
}

