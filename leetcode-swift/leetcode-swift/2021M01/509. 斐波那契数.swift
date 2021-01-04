//
//  509. 斐波那契数.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/4.
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
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        
        var f1 = 0
        var f2 = 1
        for _ in 2...n {
            let tmp = f2
            f2 = f1 + f2
            f1 = tmp
        }
        
        return f2
    }
}
