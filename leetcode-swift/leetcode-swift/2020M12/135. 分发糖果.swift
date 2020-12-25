//
//  135. 分发糖果.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/24.
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
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 0 else {
            return 0
        }
        let n = ratings.count
        var ans = 0
        var left = [Int](repeating: 1, count: n)
        for i in 1..<n {
            if ratings[i] > ratings[i-1] {
                left[i] = left[i-1] + 1
            }
        }
        var right = 0
        for i in (0...n-1).reversed() {
            if i < n-1, ratings[i] > ratings[i+1] {
                right += 1
            } else {
                right = 1
            }
            ans += max(left[i], right)
        }
        
        return ans
    }
}
