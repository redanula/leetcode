//
//  714. 买卖股票的最佳时机含手续费.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/17.
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
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        
        guard prices.count > 0 else {
            return 0
        }
        
        let n = prices.count
        
        var f1 = 0
        var f2 = -prices[0]
        
        for i in 1..<n {
            // 本次最终不持有
            f1 = max(f1, f2 + prices[i] - fee)
                
            // 本次最终持有
            f2 = max(f2, f1 - prices[i])
        }
        return f1
    }
}
