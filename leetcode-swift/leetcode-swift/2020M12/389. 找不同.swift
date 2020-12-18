//
//  389. 找不同.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/18.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：Hash
    时间复杂度：O(n)
    空间复杂度：O(s+t)
*/

import Foundation
extension Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        
        var hashMap = [Character: Int]()
        
        for c in s {
            if let _ = hashMap[c] {
                hashMap[c]! += 1
            } else {
                hashMap[c] = 1
            }
        }
        
        for c in t {
            if let _ = hashMap[c] {
                hashMap[c]! -= 1
                if hashMap[c]! < 0 {
                    return c
                }
            } else {
                return c
            }
        }
        
        return t.last!
    }
}
