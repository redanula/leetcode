/*
    关键：
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
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        let left = countNodes(root?.left)
        let right = countNodes(root?.right)
        return left + right + 1
    }
}
