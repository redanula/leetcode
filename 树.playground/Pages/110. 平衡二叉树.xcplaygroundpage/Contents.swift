/*
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(n)
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
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return height(root) >= 0
    }
    
    func height(_ root: TreeNode?) -> Int {
        
        if root == nil {
            return 0
        }
        
        let l = height(root?.left)
        let r = height(root?.right)
    
        if l == -1 || r == -1 || abs(r - l) > 1 {
            return -1
        } else {
            return max(l, r) + 1
        }
    }
}
