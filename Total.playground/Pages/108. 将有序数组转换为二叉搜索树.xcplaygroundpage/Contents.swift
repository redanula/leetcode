/*
    108. 将有序数组转换为二叉搜索树
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(log(n))
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArray(nums, 0, nums.count - 1)
    }
    
    
    func sortedArray(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
       
        guard left <= right else {
            return nil
        }
        
        let mid = (right + left) / 2
        let node = TreeNode.init(nums[mid])
        node.left = sortedArray(nums, left, mid - 1)
        node.right = sortedArray(nums, mid + 1, right)
        return node
    }
    
    
}

func test(_ node: TreeNode?) {
    let n = node
    if n != nil {
        print("\(n!.val)")
        test(n!.left)
        test(n!.right)
    }
}

let s = Solution()
let r = s.sortedArrayToBST([-10,-3,0,5,9])
let r2 = s.sortedArrayToBST([1,2,3,4,5,6,7])
test(r)


