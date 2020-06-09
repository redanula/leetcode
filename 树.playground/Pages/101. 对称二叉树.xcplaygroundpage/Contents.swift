/*
    101. 对称二叉树
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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return symmetricTwo(root?.left, root?.right)
}

func symmetricTwo(_ leftNode: TreeNode?, _ rightNote: TreeNode?) -> Bool {
    
    if leftNode == nil, rightNote == nil {
         return true
    } else if let left = leftNode,let right = rightNote {
        if left.val == right.val {
            return symmetricTwo(left.left, right.right) && symmetricTwo(left.right, right.left)
        }
    }
    return false
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

let r = isSymmetric(a)
