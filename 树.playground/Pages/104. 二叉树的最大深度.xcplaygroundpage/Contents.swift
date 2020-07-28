/*
    104. 二叉树的最大深度
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(d)
*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        return dfs(root, 0)
    }
    
    func dfs(_ root: TreeNode?, _ deep: Int) -> Int {
        guard root != nil else {
            return deep
        }
        
        let nDeep = deep + 1
        return max(dfs(root?.left, nDeep), dfs(root?.right, nDeep))
    }
}

 
let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(2)
let all = TreeNode.init(3)
let alr = TreeNode.init(3)
let arl = TreeNode.init(3)
let arr = TreeNode.init(3)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
ar.right = arr

let s = Solution()
let r = s.maxDepth(a)
