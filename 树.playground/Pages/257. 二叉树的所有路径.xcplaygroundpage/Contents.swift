/*
    First / Best
    关键：dfs
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        
        guard root != nil else {
            return []
        }
        
        var ans = [String]()
        func dfs(_ node:TreeNode?, _ deep: String) {
            
            // 如果是叶子
            if node?.left == nil && node?.right == nil {
                ans.append(deep + String(node!.val))
                return
            }
            
            let nDeep = deep + String(node!.val) + "->"
            if let n = node?.left {
                dfs(n, nDeep)
            }
            if let n = node?.right {
                dfs(n, nDeep)
            }
        }
        
        dfs(root, "")
        return ans
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
let r = s.binaryTreePaths(a)
