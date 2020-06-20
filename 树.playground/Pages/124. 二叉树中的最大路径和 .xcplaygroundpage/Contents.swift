/*
    124. 二叉树中的最大路径和
    First / Best
    关键：dfs
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
    
    var ans = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        
        guard root != nil else {
            return 0
        }
        
        dmax(root)
    
        return ans
    }
    
    func dmax(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            let left = dmax(root?.left)
            let right = dmax(root?.right)
            let oneNode = root!.val + max(0, max(left, right))
            let twoNode = root!.val +  max(0, left) +  max(0, right)
            ans = max(ans, max(oneNode, twoNode))
            return oneNode
        }
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
let r = s.maxPathSum(a)
