//
//  File.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/9.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：回溯+剪枝
    时间复杂度：O(n(logc)^2)
    空间复杂度：O(n)
*/

import Foundation
extension Solution {
    func splitIntoFibonacci(_ S: String) -> [Int] {
        var list = [Int]()
        let _ = self.backtrack(&list, S, S.count, 0, 0, 0)
        return list
    }
    
    func backtrack(_ list: inout [Int], _ s: String , _ length: Int , _ index: Int , _ sum: Int , _ prev: Int) -> Bool {
        if index == length {
            return list.count >= 3
        }
        var currLong: Int64 = 0
        for i in index ..< length {
            if i > index && s[s.index(s.startIndex, offsetBy: index)] == "0" {
                break
            }
            let curIndex = s.index(s.startIndex, offsetBy: i)
            currLong = currLong * 10 + Int64.init(String(s[curIndex]))!
            if currLong > Int32.max {
                break
            }
            let curIntValue: Int = Int(currLong)
            if list.count >= 2 {
                if curIntValue < sum {
                    continue
                }else if (curIntValue > sum){
                    break
                }
            }
            list.append(curIntValue)
            if self.backtrack(&list, s, length, i + 1, prev + curIntValue, curIntValue) {
                return true
            } else {
                list.removeLast()
            }
        }
        return false
    }
}
