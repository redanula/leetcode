//
//  217. 存在重复元素.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/13.
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
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashCount = [Int: Bool]()
        for n in nums {
            if let _ = hashCount[n] {
                return true
            } else {
                hashCount[n] = true
            }
        }
        
        return false
    }
}
