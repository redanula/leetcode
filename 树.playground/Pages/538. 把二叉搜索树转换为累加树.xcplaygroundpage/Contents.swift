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
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        
        var ans = root
        
        func dfs(_ node: inout TreeNode?, _ sum: inout Int) {
            
            if node == nil {
                return
            }
            
            dfs(&node!.right, &sum)
            sum += node!.val
            node?.val = sum
            dfs(&node!.left, &sum)
            
        }
        
        var sum = 0
        dfs(&ans, &sum)
        
        return ans
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
let r = s.convertBST(a)
