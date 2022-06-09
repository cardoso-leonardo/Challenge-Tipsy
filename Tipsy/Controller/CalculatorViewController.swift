//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!

    var bill = BillBrain()
    let segueId = "segueResultViewController"
    
    @IBAction func tipSelected(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        bill.setPercentage(s: sender.titleLabel!.text!)
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        bill.setSplit(p: Float(sender.value))
        splitLabel.text = String(format: "%.0f", sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {

        let value = Float(valueTextField.text ?? "0.0")!
        bill.setValue(v: value)
        performSegue(withIdentifier: segueId, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let resultVC = segue.destination as! ResultViewController
            resultVC.result = bill.calculateTotal()
            resultVC.tip = bill.getTip()
            resultVC.totalPeople = bill.getPeople()
        }
    
    }
}

