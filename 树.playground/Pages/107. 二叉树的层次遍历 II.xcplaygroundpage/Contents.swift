/*
    First / Best
    关键：DFS
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        
        func dfs(_ node: TreeNode?, _ deep: Int) {
            
            guard node != nil else {
                return
            }
            if ans.count >= deep + 1 {
                ans[deep].append(node!.val)
            } else {
                ans.append([node!.val])
            }
            
            dfs(node?.left, deep + 1)
            dfs(node?.right, deep + 1)
        }
        
        dfs(root, 0)
        return ans.reversed()
    }
}

let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(3)
//let all = TreeNode.init(3)
let alr = TreeNode.init(4)
let arl = TreeNode.init(5)
//let arr = TreeNode.init(3)
a.left = al
a.right = ar
//al.left = all
al.right = alr
ar.left = arl
//ar.right = arr
let s = Solution()
let r = s.levelOrderBottom(a)
let r2 = s.levelOrderBottom(nil)
let r3 = s.levelOrderBottom(arl)
