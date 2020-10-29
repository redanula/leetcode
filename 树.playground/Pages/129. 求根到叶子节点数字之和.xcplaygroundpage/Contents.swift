/*
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {

    func sumNumbers(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return dfs(root, 0)
    }

    func dfs(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        var total = sum * 10 + root!.val
        if root?.left == nil && root?.right == nil {
            return total
        }
        return dfs(root?.left, total) + dfs(root?.right, total)
    }
}
