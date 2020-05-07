/*
    572. 另一个树的子树
    First / Best
    关键：递归
    时间复杂度：O(∣s∣×∣t∣)
    空间复杂度：O(max{ds深度，dt深度})
*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    
    guard let s = s else { return false }
    guard let t = t else { return false }
    if compareTree(s, t) {
        return true
    }
    return isSubtree(s.left, t) || isSubtree(s.right, t)

}

func compareTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil && t == nil {
        return true
    } else if s == nil && t != nil {
        return false
    } else if s != nil && t == nil {
        return false
    } else {
        
        if t?.val == s?.val {
            return (compareTree(s?.left, t?.left) && compareTree(s?.right, t?.right))
        } else {
            return false
        }
    }
}


// case 1
let t1 = TreeNode.init(1)
let t2 = TreeNode.init(2)
let t = TreeNode.init(3,t1,t2)

let s11 = TreeNode.init(1)
let s12 = TreeNode.init(2)
let s1 = TreeNode.init(4,s11,nil)
let s2 = TreeNode.init(5,s12,nil)
let s = TreeNode.init(3,s1,s2)

let r = isSubtree(s, t)

////// case 2
//let t1 = TreeNode.init(1)
//let t = TreeNode.init(1,nil,nil)
//
//let s = TreeNode.init(1,t1,nil)
//
//let r = isSubtree(s, t)
