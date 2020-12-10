//
//  860. 柠檬水找零.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/10.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

extension Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        
        guard bills.count > 0 else {
            return true
        }
        
        var change = (0, 0)
        
        for b in bills {
            if b == 20 {
                if change.0 > 0, change.1 > 0 {
                    change = (change.0 - 1, change.1 - 1)
                } else if change.0 > 2 {
                    change = (change.0 - 3, change.1)
                } else {
                    return false
                }
            } else if b == 10 {
                if change.0 > 0 {
                    change = (change.0 - 1, change.1 + 1)
                } else {
                    return false
                }
            } else {
                change.0 += 1
            }
        }
        
        return true
    }
}
