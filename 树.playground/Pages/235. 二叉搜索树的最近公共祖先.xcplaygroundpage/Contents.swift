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
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        var ans = root
        while true {
            if ans!.val > p!.val, ans!.val > q!.val {
                ans = ans?.left
            } else if ans!.val < p!.val, ans!.val < q!.val {
                ans = ans?.right
            } else {
                break
            }
        }
        
        return ans
    }
}


let a = TreeNode.init(6)
let al = TreeNode.init(2)
let ar = TreeNode.init(8)
let all = TreeNode.init(0)
let alll = TreeNode.init(4)
let allr = TreeNode.init(7)
let arl = TreeNode.init(9)
let arr = TreeNode.init(4)
let arrl = TreeNode.init(3)
let arrr = TreeNode.init(5)
a.left = al
a.right = ar
al.left = all
all.left = alll
all.right = allr
ar.left = arl
ar.right = arr
arr.left = arrl
arr.right = arrr
let s = Solution()
let r = s.lowestCommonAncestor(a, al, ar)
print(r!.val)


