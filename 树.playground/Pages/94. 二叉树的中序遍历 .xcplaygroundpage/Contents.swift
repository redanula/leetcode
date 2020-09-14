/*
    First / Best
    关键：
    时间复杂度：O()
    空间复杂度：O()
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
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        dfs(root, &ans)
        return ans
    }
    
    func dfs(_ node: TreeNode?, _ ans: inout [Int]) {
        if node == nil {
            return
        }
        dfs(node?.left, &ans)
        ans.append(node!.val)
        dfs(node?.right, &ans)
    }
}

let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(3)
//a.right = al
//al.left = ar
let all = TreeNode.init(3)
let alr = TreeNode.init(4)
let arl = TreeNode.init(5)
//let arr = TreeNode.init(3)
a.left = al
a.right = ar
////al.left = all
//al.right = alr
//ar.left = arl
//ar.right = arr
let s = Solution()
let r = s.inorderTraversal(a)
