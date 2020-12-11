//
//  649. Dota2 参议院.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/11.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

import Foundation

extension Solution {
    func predictPartyVictory(_ senate: String) -> String {
        
        guard senate.count > 0 else {
            return ""
        }
        let sa = Array(senate)
        let n = sa.count
        var rs = [Int]()
        var ds = [Int]()

        if String(sa[0]) == "R" {
        } else {

        }
        for i in 0..<sa.count {
            if String(sa[i]) == "R" {
                rs.append(i)
            } else {
                ds.append(i)
            }
        }

        while rs.count > 0, ds.count > 0 {
            
            let rf = rs.removeFirst()
            let df = ds.removeFirst()
            if rf < df {
                rs.append(rf + n)
            }
            else {
                ds.append(df + n)
            }
        }

        return rs.count > 0 ? "Radiant" : "Dire"
    }
}
