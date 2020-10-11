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
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        
        var ans = Int.max
        var last = -1
        
        func dfs(_ node: TreeNode?) {
            
            guard node != nil else {
                return
            }
            
            dfs(node?.left)
            
            if last == -1 {
                last = node!.val
            } else {
                ans = min(ans, node!.val - last)
                last = node!.val
            }
            
            dfs(node?.right)
            
        }
        
        dfs(root)
        return ans
    }
}
