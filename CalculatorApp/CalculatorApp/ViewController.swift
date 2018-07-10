//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Hassan M Ashraful on 29/6/18.
//  Copyright © 2018 Hassan M Ashraful. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath:Bool = false
    var operation = 0
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    @IBAction func operation_buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(label.text!)!
            if sender.tag == 12 { //Divide
                label.text = "/"
            }else if sender.tag == 13 { //Multiply
                label.text = "*"
            }else if sender.tag == 14 { // Minus
                label.text = "-"
            }else{  //Plus
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }else if sender.tag == 16 {
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
                
            }else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
                
            }else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
                
            }else{
                label.text = String(previousNumber + numberOnScreen)
            }
        }else {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello dear")
        print("cool")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

