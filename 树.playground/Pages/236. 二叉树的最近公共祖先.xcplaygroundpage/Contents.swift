/*
    236. 二叉树的最近公共祖先
    First / Best
    关键：递归
    时间复杂度：O(logx)
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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    if root == nil {
        return nil
    }
    
    if root === p || root === q {
        return root
    }
    
    var left = lowestCommonAncestor(root?.left, p, q)
    var right = lowestCommonAncestor(root?.right, p, q)
    
    if left == nil {
        return right
    } else if right == nil {
        return left
    } else {
        return root
    }
}

let t1 = TreeNode.init(1)
let t2 = TreeNode.init(2)
let t = TreeNode.init(3)
t.left = t1
t.right = t2
let r = lowestCommonAncestor(t,t1,t2)
print(r!.val)
