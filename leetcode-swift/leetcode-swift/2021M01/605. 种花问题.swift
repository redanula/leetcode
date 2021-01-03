//
//  605. 种花问题.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/1.
//  Copyright © 2021 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
import Foundation
extension Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var c = 0
        var i = 0
        while i < flowerbed.count {
            if flowerbed[i] == 0 && (i==0 || flowerbed[i-1] == 0) && (i==flowerbed.count-1 || flowerbed[i+1]==0) {
                c += 1
                flowerbed[i] = 1
                i += 1
                if c == n {
                  return true
                }
            }
            i += 1
        }
        return c >= n
    }
}
