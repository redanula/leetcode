/*
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(h)
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
    
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard root != nil else {
            return 0
        }
        
        return countDepth(root, 1)
    }
    
    func countDepth(_ root: TreeNode?, _ deep: Int) -> Int {
        if root == nil {
            return deep
        }
        
        if root?.left != nil && root?.right != nil {
            return min(countDepth(root?.left, deep + 1), countDepth(root?.right, deep + 1))
        } else if root?.left != nil {
            return countDepth(root?.left, deep + 1)
        } else if root?.right != nil {
            return countDepth(root?.right, deep + 1)
        }
        
        return deep
    }
}
