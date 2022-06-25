//
//  BillBrain.swift
//  Tipsy
//
//  Created by Leonardo Cardoso on 08/06/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct BillManager {
    
    var value: Double?
    var percentage: Double?
    var splitNumber: Double?
    
    mutating func setPercentage(s pctSelected: String) {
        switch pctSelected {
        case "0%":
            percentage = 0.0
        case "10%":
            percentage = 0.1
        case "20%":
            percentage = 0.2
        default:
            percentage = 0.0
        }
    }
    
    mutating func setValue(v value: Double) {
        self.value = value
    }
    
    mutating func setSplit(p split: Double) {
        splitNumber = split
    }
    
    func calculateTotal() -> Double {
        if let value = value, let percentage = percentage, let splitNumber = splitNumber {
            return (value*(percentage+1))/splitNumber
        }
        return 0.0
    }

    func getTip() -> Double {
        if let percentage = percentage {
            return percentage*100
        }
        return 0.0
    }
    
    func getPeople() -> Double {
        if let splitNumber = splitNumber {
            return splitNumber
        }
        return 0.0
    }
  
}
