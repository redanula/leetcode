//
//  628. 三个数的最大乘积.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/20.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
/*
    First / Best
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(logn)
*/
extension Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        
        let snum = nums.sorted()
        let n = snum.count
        let m1 = snum[n-1] * snum[n-2] * snum[n-3]
        let m2 = snum[0] * snum[1] * snum[n-1]
        return max(m1, m2)
    }
}
