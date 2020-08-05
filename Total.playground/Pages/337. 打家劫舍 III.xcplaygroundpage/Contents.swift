/*
    First / Best
    关键：动态规划
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
    func rob(_ root: TreeNode?) -> Int {
        let ans = dfs(root)
        return max(ans.0, ans.1)
    }
    
    func dfs(_ root: TreeNode?) -> (Int, Int) {
        if root == nil {
            return (0, 0)
        }
        let dpLeft = dfs(root?.left)
        let dpRight = dfs(root?.right)
        let dp0 = max(dpLeft.0, dpLeft.1) + max(dpRight.0, dpRight.1)
        let dp1 = dpLeft.0 + dpRight.0 + root!.val
        
        return (dp0, dp1)
    }
}
/*
       1
     2   3
    4 5 6 null

        (15,16)
   (9,2)      (6,3)
(0,4) (0,5) (0,6)  0,0

f(n)[0] = max(f(n.left)[0], f(n.left)[1]) + max(f(n.right)[0], f(n.right)[1])
f(n)[1] = f(n.left)[0] + f(n.right)[0] + val(n)
*/

let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
let arl = TreeNode.init(6)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
let s = Solution()
let r = s.rob(a)
