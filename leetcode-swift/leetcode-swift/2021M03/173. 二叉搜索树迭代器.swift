//
//  173. 二叉搜索树迭代器.swift
//  leetcode-swift
//
//  Created by ylj on 2021/3/28.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation

class BSTIterator {

    var values:[Int] = []
    var index:Int = -1

    init(_ root: TreeNode?) {
        dfs(root)
        self.index = -1
    }

    func dfs(_ node: TreeNode?) {
        if node == nil {
            return
        }

        dfs(node?.left)
        values.append(node!.val)
        dfs(node?.right)
    }
    
    func next() -> Int {
        if self.index < self.values.count - 1 {
            self.index += 1
            return self.values[self.index]
        } else {
            return -1
        }
    }
    
    func hasNext() -> Bool {
        return self.index < self.values.count - 1
    }
}
