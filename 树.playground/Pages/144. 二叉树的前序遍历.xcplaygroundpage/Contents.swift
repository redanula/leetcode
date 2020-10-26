/*
    关键：递归\迭代
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        
        func dfs(_ node:TreeNode?) {
            
            if node == nil {
                return
            }
            
            dfs(node?.left)
            ans.append(node!.val)
            dfs(node?.right)
        }
        
        dfs(root)
        return ans
    }
}


let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
let arl = TreeNode.init(6)
let arr = TreeNode.init(7)

a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
ar.right = arr

let s = Solution()
let r = s.postorderTraversal(a)

