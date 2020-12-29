//
//  330. 按要求补齐数组.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/29.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O()
    空间复杂度：O()
*/

import Foundation
extension Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var maxi = 1
        var i = 0, res = 0
        while maxi <= n {
            if i < nums.count && nums[i] <= maxi {
                maxi += nums[i]
                i += 1
            } else{
                maxi += maxi
                res += 1
            }
        }
        return res
    }
}
