//
//  103. 二叉树的锯齿形层序遍历.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/22.
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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        
        var ans = [[Int]]()
        dfs(root, 0, &ans)
        return ans
    }
    
    func dfs(_ node: TreeNode?, _ level: Int, _ r: inout [[Int]]) {
        
        if node == nil {
            return
        }
        
        if r.count <= level {
            r.append([node!.val])
        } else {
            if level % 2 == 0 {
                r[level].append(node!.val)
            } else {
                r[level].insert(node!.val, at: 0)
            }
            
        }
        
        dfs(node?.left, level + 1, &r)
        dfs(node?.right, level + 1, &r)
    }
    
}
