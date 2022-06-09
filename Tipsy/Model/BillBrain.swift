//
//  BillBrain.swift
//  Tipsy
//
//  Created by Leonardo Cardoso on 08/06/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

struct BillBrain {
    
    var bill: Bill?
    
    init() {
        bill = Bill(value: 0, percentage: 0, splitNumber: 0)
    }
    
    mutating func setPercentage(s pctSelected: String) {
        switch pctSelected {
        case "0%":
            bill?.percentage = 0.0
        case "10%":
            bill?.percentage = 0.1
        case "20%":
            bill?.percentage = 0.2
        default:
            bill?.percentage = 0.0
        }
    }
    
    mutating func setValue(v value: Float) {
        bill?.value = value
    }
    
    mutating func setSplit(p split: Float) {
        bill?.splitNumber = split
    }
    
    func calculateTotal() -> Float {
        
        let value = bill?.value ?? 0.0
        let percentage = bill?.percentage ?? 0.0
        let splitNumber = Float(bill?.splitNumber ?? 1)
        return (value*(percentage+1))/splitNumber
        
    }

    func getTip() -> Float {
        return (bill?.percentage ?? 0)*100
    }
    
    func getPeople() -> Float {
        return bill?.splitNumber ?? 0
    }
  
}
