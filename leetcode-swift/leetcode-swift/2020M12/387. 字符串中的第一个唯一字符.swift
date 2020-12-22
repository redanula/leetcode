//
//  387. 字符串中的第一个唯一字符.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/23.
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
    func firstUniqChar(_ s: String) -> Int {
        let sa = Array(s)
        var hashCount = [Character: Int]()
        
        for i in 0..<sa.count {
            if hashCount[sa[i]] == nil {
                hashCount[sa[i]] = 1
            } else {
                hashCount[sa[i]]! += 1
            }
        }
        
        for i in 0..<sa.count {
            if hashCount[sa[i]] == 1 {
                return i
            }
        }
        
        return -1
    }
}
