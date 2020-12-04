//
//  659. 分割数组为连续子序列.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/4.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func isPossible(_ nums: [Int]) -> Bool {

        let n = nums.count
        guard n >= 3 else {
            return false
        }
        
        // 统计
        var hashCount = [Int: Int]()
        var hashEnd = [Int: Int]()
        hashCount[0] = 0
        hashEnd[0] = 0
        for num in nums {
            if let _ = hashCount[num] {
                hashCount[num]! += 1
            } else {
                hashCount[num] = 1
                hashEnd[num] = 0
            }
        }
        
        for num in nums {
            let count = hashCount[num]!
            if count > 0 {
                var preEndCount = 0
                if let _ = hashEnd[num-1] {
                    preEndCount = hashEnd[num-1]!
                }
                if preEndCount > 0 {
                    hashCount[num]! -= 1
                    hashEnd[num-1]! -= 1
                    hashEnd[num]! += 1
                } else {
                    var c1 = 0
                    if let _ = hashCount[num+1] {
                        c1 = hashCount[num+1]!
                    }
                    var c2 = 0
                    if let _ = hashCount[num+2] {
                        c2 = hashCount[num+2]!
                    }
                    if c1 > 0, c2 > 0 {
                        hashCount[num]! -= 1
                        hashCount[num+1]! = c1 - 1
                        hashCount[num+2]! = c2 - 1
                        if let _ = hashEnd[num+2] {
                            hashEnd[num+2]! += 1
                        } else {
                            hashEnd[num+2] = 1
                        }
                    } else {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}
