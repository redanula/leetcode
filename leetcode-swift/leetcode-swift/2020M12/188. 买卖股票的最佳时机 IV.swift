//
//  188. 买卖股票的最佳时机 IV.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/28.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(n*min(n,k))
    空间复杂度：O(n*min(n,k))
*/

import Foundation
extension Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard prices.count > 0, k > 0 else {
           return 0
        }

        let n = prices.count
        let limitK = min(k, n/2)
        var sell = [Int](repeating: Int.min/2, count: limitK + 1)
        var buy = [Int](repeating: Int.min/2, count: limitK + 1)
        
        sell[0] = 0
        buy[0] = -prices[0]

        for i in 1..<n {
            buy[0] = max(buy[0], sell[0] - prices[i])
            for j in 1...limitK {
               buy[j] = max(buy[j], sell[j] - prices[i])
               sell[j] = max(sell[j], buy[j - 1] + prices[i])
           }
        }
        
        return sell.max()!
    }
}
