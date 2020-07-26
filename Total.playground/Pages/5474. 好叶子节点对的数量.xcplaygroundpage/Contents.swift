
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
//    var ans = 0
//    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
//        guard root != nil else {
//            return 0
//        }
//        
//        dfs(root, distance)
//        return ans
//    }
//    
//    func dfs(_ root: TreeNode?, _ maxValue: Int) {
//        if root == nil {
//            return
//        }
//        
//        if maxValue <= root!.val {
//            ans += 1
//        }
//        
//        let newValue = max(maxValue, root!.val)
//        
//        dfs(root!.left, newValue)
//        dfs(root!.right, newValue)
//    }
}

let s = Solution()
let r = s.countPairs(nil, 1)
