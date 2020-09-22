/*
    First / Best
    关键：
    时间复杂度：O(min(n,m))
    空间复杂度：O(min(n,m))
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
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        return dfs(t1, t2)
    }
    
    func dfs(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        
        if t1 != nil, t2 != nil {
            let mergeVal = t1!.val + t2!.val
            let node = TreeNode.init(mergeVal)
            node.left = dfs(t1?.left, t2?.left)
            node.right = dfs(t1?.right, t2?.right)
            return node
        }
        
        if t1 == nil, t2 != nil {
            return t2
        }
        
        if t1 != nil, t2 == nil {
            return t1
        }
        
        return nil
    }
    
}

let a = TreeNode.init(5)
let al = TreeNode.init(2)
let ar = TreeNode.init(7)
let all = TreeNode.init(1)
let alr = TreeNode.init(3)
let arl = TreeNode.init(6)
let arr = TreeNode.init(8)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
ar.right = arr
let b = a
let s = Solution()
let r = s.mergeTrees(a, b)
