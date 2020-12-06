//
//  118. 杨辉三角.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/6.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(n^2)
    空间复杂度：O(n)
*/

extension Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        
        guard numRows > 2 else {
            if numRows == 1 {
                return [[1]]
            }
            
            if numRows == 2 {
                return [[1],[1,1]]
            }
            
            return []
        }
        
        var ans = [[Int]]()
        ans.append([1])
        ans.append([1,1])
        for i in 3...numRows {
            var next = Array.init(repeating: 1, count: i)
            for j in 1..<ans[i-2].count {
                next[j] = ans[i-2][j-1] + ans[i-2][j]
            }
            ans.append(next)
        }
        
        return ans
    }
}

