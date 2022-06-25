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
    let segueId = "segueResultViewController"
    
    var billManager = BillManager()
    
    
    override func viewDidLoad() {
        valueTextField.delegate = self
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billManager.setPercentage(s: sender.titleLabel!.text!)
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        billManager.setSplit(p: Double(sender.value))
        splitLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if valueTextField.text == "" {
            valueTextField.placeholder = "Add a value here"
        }
        
        if let value = valueTextField.text {
            if let valueFloat = Double(value) {
                billManager.setValue(v: valueFloat)
                performSegue(withIdentifier: segueId, sender: self)
            }
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let resultVC = segue.destination as! ResultViewController
            resultVC.result = billManager.calculateTotal()
            resultVC.tip = billManager.getTip()
            resultVC.totalPeople = billManager.getPeople()
        }
        
    }
}

extension CalculatorViewController: UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        valueTextField.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == valueTextField.tag {
            if string == "," {
                textField.text = textField.text! + "."
                return false
            }
        }
        return true
    }
    
}

