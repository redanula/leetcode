/*
    First / Best
    关键：
    时间复杂度：O(nlogn)
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
    
    func findMode(_ root: TreeNode?) -> [Int] {
        
        var ans = [Int]()
        var dict: [Int: Int] = [:]
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            if dict.keys.contains(node.val) {
                dict[node.val]! += 1
            } else {
                dict.updateValue(1, forKey: node.val)
            }
            dfs(node.left)
            dfs(node.right)
        }
        
        dfs(root)
        let sorted = Array(dict).sorted(by: { $0.value > $1.value })
       
        for item in sorted {
            if item.value == sorted[0].value {
                ans.append(item.key)
            } else {
                break
            }
        }
        return ans
    }
}



let a = TreeNode.init(5)
let al = TreeNode.init(2)
let ar = TreeNode.init(7)
let all = TreeNode.init(1)
let alr = TreeNode.init(3)
let arl = TreeNode.init(6)
let arr = TreeNode.init(8)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.left = arl
ar.right = arr
let s = Solution()
let r = s.findMode(a)
