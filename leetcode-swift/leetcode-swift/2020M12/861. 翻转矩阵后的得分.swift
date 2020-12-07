
//
//  File.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/7.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(mn)
    空间复杂度：O(1)
*/
import Foundation

extension Solution {
    func matrixScore(_ A: [[Int]]) -> Int {
        guard A.count > 0 else {
            return 0
        }
        guard A[0].count > 0 else {
            return 0
        }
        
        let n = A.count
        let m = A[0].count
        
        var ans:Int = 0
        
        // 把第一列都变成1
        var ta = A
        for i in 0..<n {
            if ta[i][0] == 0 {
                ta[i][0] = 1
                for j in 1..<m {
                    ta[i][j] = (ta[i][j] == 0 ? 1 : 0)
                }
            }
            ans = ans + Int(truncating: pow(2, m-1) as NSNumber)
        }
        
        // 统计2列之后的每一列的0和1的最大数量*2的幂
        for j in 1..<m {
            var maxCount = 0
            for i in 0..<n {
                maxCount += ta[i][j]
            }
            maxCount = max(maxCount, n - maxCount)
            ans = ans + Int(truncating: pow(2, m-j-1) as NSNumber) * maxCount
//            print(ans, maxCount)
        }
        
        return Int(truncating: ans as NSNumber)
    }
}
