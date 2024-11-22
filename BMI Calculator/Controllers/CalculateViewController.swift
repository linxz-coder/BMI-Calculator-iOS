//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //四舍五入
        let roundedHeight = String(format: "%.2f", sender.value)
        
        heightLabel.text = "\(roundedHeight)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let roundedWeight = String(format: "%.f", sender.value)
        
        weightLabel.text = "\(roundedWeight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value;
        let weight = weightSlider.value;
//        let bmi = weight / pow(height,2)
        
       
        calculatorBrain.calculateBMI(height:height, weight:weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController //为什么要as!?因为downcasting，即告诉它降级到子class-ResultsViewController，而不是原本的UIViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    



}

