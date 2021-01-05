//
//  830. 较大分组的位置.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/5.
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
    func largeGroupPositions(_ s: String) -> [[Int]] {
        
        guard s.count > 0 else {
            return []
        }
        
        var ans = [[Int]]()
        let sa = Array(s)
        
        var i = 1
        var startI = 0
        var endI = 0
        while i < sa.count {
            if sa[i] != sa[endI] {
                if endI - startI >= 2 {
                    ans.append([startI, endI])
                }
                startI = i
                endI = i
            } else {
                endI = i
            }
            
            if i == sa.count - 1 {
                if i - startI >= 2 {
                    ans.append([startI, i])
                }
            }
            
            i += 1
        }
        
        return ans
    }
}
