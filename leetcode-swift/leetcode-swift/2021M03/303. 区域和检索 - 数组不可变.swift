//
//  303. 区域和检索 - 数组不可变.swift
//  leetcode-swift
//
//  Created by ylj on 2021/3/1.
//  Copyright © 2021 com. All rights reserved.
//

/*
    First / Best
    关键：前缀和
    时间复杂度：初始化O(n), 检索O(1)
    空间复杂度：O(n)
*/

import Foundation

class NumArray {

    var snums:[Int] = []
    
    init(_ nums: [Int]) {
        
        var sum = 0
        snums.append(0)
        for num in nums {
            sum += num
            snums.append(sum)
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        
        guard i <= j || j <= snums.count else {
            return 0
        }
        
        return snums[j+1] - snums[i]
    }
}
