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
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var ans = [Double]()
        var tmp = [Int: (Int, Int)]()
        func depth(_ node: TreeNode?, _ deep: Int) {
            if node == nil {
                return
            }
            if let _ = tmp[deep] {
                tmp[deep] = (tmp[deep]!.0 + 1, tmp[deep]!.1 + node!.val)
            } else {
                tmp[deep] = (1, node!.val)
            }
            depth(node?.left, deep+1)
            depth(node?.right, deep+1)
        }
        
        depth(root, 0)
        for i in 0..<tmp.count {
            if let item = tmp[i] {
                ans.append(Double(item.1)/Double(item.0))
            }
        }
        
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
let r = s.averageOfLevels(a)
