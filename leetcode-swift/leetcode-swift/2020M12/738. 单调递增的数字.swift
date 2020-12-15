//
//  738. 单调递增的数字.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/15.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(logn)
    空间复杂度：O(logn)
*/
import Foundation
extension Solution {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        
        guard N > 0 else {
            return 0
        }
        
        var sa = Array(String(N))
        var i = 1
        while i < sa.count, Int(String(sa[i-1]))! <= Int(String(sa[i]))! {
            i += 1
        }
        
        if i < sa.count {
            while i > 0, Int(String(sa[i-1]))! > Int(String(sa[i]))! {
                sa[i-1] = Character(String(Int(String(sa[i-1]))! - 1))
                i -= 1
            }
            
            for j in i+1..<sa.count {
                sa[j] = "9"
            }
        }
        
        
        return Int(String(sa))!
    }
}
