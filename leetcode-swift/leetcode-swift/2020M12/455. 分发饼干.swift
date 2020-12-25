//
//  455. 分发饼干.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/25.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/

import Foundation
extension Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gs = g.sorted()
        let ss = s.sorted()
        var ans = 0
        var i = ss.count - 1, j = gs.count - 1
        while i >= 0, j >= 0 {
            if ss[i] >= gs[j] {
                i -= 1
                j -= 1
                ans += 1
            } else {
                j -= 1
            }
        }
        
        return ans
    }
}
