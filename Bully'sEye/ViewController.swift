//
//  ViewController.swift
//  Bully'sEye
//
//  Created by Saivishal Gummadi on 3/25/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert () {
        let controller = UIAlertController(title: "Hello", message: "Its my begining of my app ", preferredStyle: .alert)
        let alert = UIAlertAction(title: "Restart", style: .default, handler: nil)
        present(controller, animated: true, completion: nil)
    }

}

