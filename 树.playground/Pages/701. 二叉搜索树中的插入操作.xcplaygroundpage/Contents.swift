/*
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(1)
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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else {
            return TreeNode.init(val)
        }
        var p = root
        while p != nil {
            if p!.val > val {
                if p?.left == nil {
                    let n = TreeNode.init(val)
                    p?.left = n
                    break
                } else {
                    p = p?.left
                }
            } else {
                if p?.right == nil {
                    let n = TreeNode.init(val)
                    p?.right = n
                    break
                } else {
                    p = p?.right
                }
            }
        }
        return root
    }
}
