//
//  376. 摆动序列.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/12.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O()
    空间复杂度：O()
*/

import Foundation
extension Solution {
    func wiggleMaxLength_1(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        
        var ans = 0
        // 遍历i，包括i的序列，每次向左延伸可达到的最长序列
        for i in 0..<nums.count {
            var lenI = 1 // 尾差正
            var lenII = 1 // 尾差负
            var left = i - 1
            var flagI = 1
            var flagII = 1
            
            while left >= 0 {
                if (nums[left + 1] - nums[left]) * flagI > 0 {
                    flagI *= -1
                    lenI += 1
                }
                
                if (nums[left + 1] - nums[left]) * flagII < 0 {
                    flagII *= -1
                    lenII += 1
                }
                left -= 1
            }
            
//            print("num:\(nums[i]), lenI:\(lenI), lenII:\(lenII)")
            
            ans = max(ans, lenI, lenII)
        }
        
        return ans
        
    }
    
    func wiggleMaxLength(_ nums: [Int]) -> Int {
            
        guard nums.count > 1 else {
            return nums.count
        }
        
        var up = 1, down = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                up = max(up, down + 1)
            } else if nums[i] < nums[i - 1] {
                down = max(up + 1, down)
            }
        }
        
        return max(up, down)
        
    }
}
