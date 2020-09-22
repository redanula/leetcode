/*
    First / Best
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
    
    func minCameraCover(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?) -> (Int, Int, Int) {
            guard node != nil else {
                return (Int.max / 2, 0, 0)
            }
            let l = dfs(node?.left)
            let r = dfs(node?.right)
            let a = l.2 + r.2 + 1
            let b = min(a, min(l.0+r.1, r.0+l.1))
            let c = min(a, l.1+r.1)
            return (a, b, c)
        }
        
        let ans = dfs(root)
        return ans.1
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
let s = Solution()
let r = s.minCameraCover(a)
