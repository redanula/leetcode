//
//  746. 使用最小花费爬楼梯.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/21.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
import Foundation
extension Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        guard cost.count > 1 else {
            return 0
        }
        var f1 = cost[0]
        var f2 = cost[1]
        for i in 2..<cost.count {
            let tmp = f2
            f2 = min(f1 + cost[i], f2 + cost[i])
            f1 = tmp
        }
        return min(f1, f2)
    }
}
