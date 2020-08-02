/*
    First / Best
    关键：前驱节点、注意当前右节点可拼接到当前左节点的最右边，后续再不断向下节点的时候再处理。
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func flatten(_ root: TreeNode?) {
        guard root != nil else {
           return
        }
        var curr = root
        while curr != nil {
            if let leftNode = curr?.left {
                let next = leftNode
                var predecessor = next
                while predecessor.right != nil {
                    predecessor = predecessor.right!
                }
                predecessor.right = curr?.right
                curr?.left = nil
                curr?.right = next
            }
            curr = curr?.right
        }
    }
    
}

let a = TreeNode.init(2)
let al = TreeNode.init(1)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
a.left = al
a.right = ar
al.left = all
al.right = alr

let s = Solution()
s.flatten(a)

