/*
    112. 路径总和
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        guard root != nil else {
            return false
        }
        
        if (root?.left) == nil, (root?.right) == nil {
            return root!.val == sum
        }
        
        return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum - root!.val)
    }
}


let a = TreeNode.init(5)
let al = TreeNode.init(4)
let ar = TreeNode.init(8)
let all = TreeNode.init(11)
let alll = TreeNode.init(7)
let allr = TreeNode.init(2)
let arl = TreeNode.init(13)
let arr = TreeNode.init(4)
a.left = al
a.right = ar
al.left = all
all.left = alll
all.right = allr
ar.left = arl
ar.right = arr
let s = Solution()
let r = s.hasPathSum(a, 22)
