//
//  1232. 缀点成线.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/17.
//  Copyright © 2021 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
import Foundation

extension Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        
        guard coordinates.count > 0 else {
            return false
        }
        
        if coordinates.count <= 2 {
            return true
        }
        
        var v:Double = Double(Int.max)
        if coordinates[1][0] != coordinates[0][0] {
            v = Double((coordinates[1][1] - coordinates[0][1]))/Double((coordinates[1][0] - coordinates[0][0]))
        }
        for i in 2..<coordinates.count {
            var nv:Double = Double(Int.max)
            if coordinates[i][0] != coordinates[0][0] {
                nv = Double((coordinates[i][1] - coordinates[0][1]))/Double((coordinates[i][0] - coordinates[0][0]))
            }
            
            if nv != v {
                return false
            }
        }
        
        return true
    }
}
