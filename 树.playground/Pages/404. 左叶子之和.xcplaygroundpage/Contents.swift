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
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var sum = 0
        
        func dfs(_ node: TreeNode?, _ isLeft: Bool) {
            if node == nil {
                return
            }
            if node?.left == nil && node?.right == nil {
                if isLeft {
                    sum = sum + node!.val
                }
                return
            }
            dfs(node?.left, true)
            dfs(node?.right, false)
        }
        
        dfs(root, false)
        
        return sum
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
let r = s.sumOfLeftLeaves(a)
