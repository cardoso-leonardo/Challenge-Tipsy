//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Leonardo Cardoso on 08/06/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var result : Double?
    var totalPeople: Double?
    var tip: Double?
    
    override func viewDidLoad() {
        resultLabel.text = String(format: "%.2f", result!)
        descriptionLabel.text = "Split between \(String(format: "%.0f", totalPeople!)) people, with \(String(format: "%.0f", tip!))% tip."
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
