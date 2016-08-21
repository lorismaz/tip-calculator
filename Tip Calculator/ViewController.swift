//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Loris Mazloum on 8/8/16.
//  Copyright © 2016 Loris Mazloum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets and actions
    @IBOutlet var costTextField: UITextField!
    @IBOutlet weak var finalCostLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        self.tipPercent = round(sender.value)
        self.tipPercentLabel.text = "\(Int(self.tipPercent))"
        
        updateFinalCostLabel()
    }
    
    @IBAction func costTextFieldChanged(sender: UITextField) {
        self.mealCost = Float(sender.text!)
        
        updateFinalCostLabel()
    }
    
    var mealCost: Float? = 0.0
    var tipPercent: Float = 20.0
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.0 * mealCost!
    }
    
    func updateFinalCostLabel() {
        if mealCost != nil {
            self.finalCostLabel.text = "\(finalCost())"
        } else if (self.costTextField.text!.isEmpty) {
            self.finalCostLabel.text = ""
        } else {
            self.finalCostLabel.text = "Invalid Cost!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

