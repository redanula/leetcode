/*
    First / Best
    关键：递归
    时间复杂度：O(n^2)
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var ans = [[Int]]()
        
        func dfs(_ node: TreeNode?, _ sum: Int, _ t: inout [Int]) {
            guard node != nil else {
                return
            }
           
            t.append(node!.val)
            if (node?.left) == nil, (node?.right) == nil {
                if(node!.val == sum) {
                    ans.append(t)
                }
            }
            
            dfs(node?.left, sum - node!.val, &t)
            dfs(node?.right, sum - node!.val, &t)
            t.popLast()
        }
        
        var t = [Int]()
        dfs(root, sum, &t)
        return ans
    }
}



let a = TreeNode.init(5)
let al = TreeNode.init(4)
let ar = TreeNode.init(8)
let all = TreeNode.init(11)
let alll = TreeNode.init(7)
let allr = TreeNode.init(2)
let arl = TreeNode.init(13)
let arr = TreeNode.init(4)
a.left = al
a.right = ar
al.left = all
all.left = alll
all.right = allr
ar.left = arl
ar.right = arr
let s = Solution()
let r = s.pathSum(a, 22)
