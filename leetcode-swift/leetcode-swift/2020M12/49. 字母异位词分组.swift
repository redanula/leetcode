//
//  49. 字母异位词分组.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/14.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(nslogs)
    空间复杂度：O(ns)
*/
import Foundation
extension Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        guard strs.count > 0 else {
            return [[]]
        }
        
        var ans = [[String]]()
        var maps = [String: Int]()
        for s in strs {
            let sa = Array(s).sorted()
            if let index = maps[String(sa)] {
                ans[index].append(s)
            } else {
                ans.append([s])
                maps[String(sa)] = ans.count - 1
            }
        }
        
        return ans
    }
}
