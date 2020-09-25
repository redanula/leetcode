/*
    First / Best
    关键：递归
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
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        let len = inorder.count
        if len != postorder.count || len < 1 { return nil }
        var left = 0 // 中序数组中根节点的位置
        while inorder[left] != postorder[len - 1] {
            left += 1
        }
        let root = TreeNode(postorder[len - 1])
        // 左节点内容为中序数组中小于根节点索引的所有元素
        root.left = buildTree(Array(inorder[0..<left]), Array(postorder[0..<left]))
        // 右节点内容为中序数组中大于根节点索引的所有元素
        root.right = buildTree(Array(inorder[left+1..<len]), Array(postorder[left..<len-1]))
        return root
    }
    
}


let inorder = [9,3,15,20,7]
let postorder = [9,15,7,20,3]
let s = Solution()
let r = s.buildTree(inorder, inorder)
