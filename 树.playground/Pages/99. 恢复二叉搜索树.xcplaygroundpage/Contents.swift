/*
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(h)
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
    func recoverTree(_ root: TreeNode?) {
        
        var stack:[TreeNode] = [TreeNode]()
        var p = root
        var pre:TreeNode? = nil
        var node1:TreeNode? = nil
        var node2:TreeNode? = nil
        while p != nil || !stack.isEmpty {
            while p != nil {
                stack.append(p!)
                p = p?.left
            }
            p = stack.popLast()
            
            if pre != nil && p!.val < pre!.val {
                node2 = p
                if node1 == nil {
                    node1 = pre
                } else {
                    break
                }
            }
            
            pre = p
            p = p?.right
        }
        
        swap(&node1, &node2)
    }
    
    func swap(_ node1: inout TreeNode?, _ node2: inout TreeNode?) {
        let tmp = node1?.val
        node1?.val = node2!.val
        node2?.val = tmp!
    }
}

let a = TreeNode.init(3)
let al = TreeNode.init(2)
let ar = TreeNode.init(6)
let all = TreeNode.init(1)
let alr = TreeNode.init(4)
let arl = TreeNode.init(5)
let arr = TreeNode.init(7)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
ar.right = arr

let s = Solution()
let r = s.recoverTree(a)
