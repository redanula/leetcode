//
//  62. 不同路径.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/10.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/

import Foundation

extension Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        guard m * n > 0 else {
            return 0
        }
        
        var dp = Array.init(repeating: Array.init(repeating: 1, count: m), count: n)
        
        for i in 1..<n {
            for j in 1..<m {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        
        return dp[n-1][m-1]
    }
}
