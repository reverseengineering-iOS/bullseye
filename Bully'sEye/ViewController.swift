//
//  ViewController.swift
//  Bully'sEye
//
//  Created by Saivishal Gummadi on 3/25/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value  = Float(currentValue)
        targetValueLabel.text = "\(targetValue)"
    }
    @IBAction func sliderMoved (_ slider: UISlider) {
        print("the value of slider: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    @IBAction func showAlert() {
        
        let difference: Int = abs(currentValue - targetValue)
        let points = 100 - difference
        let message = "You score is: \(points)"
        
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
    
        let alert = UIAlertController(title: "HEllo WORLD!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
}

