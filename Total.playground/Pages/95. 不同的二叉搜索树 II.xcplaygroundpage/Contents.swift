/*
    95. 不同的二叉搜索树 II
    First / Best
    关键：递归
    时间复杂度：卡特兰数……
    空间复杂度：卡特兰数……
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else {
            return []
        }
        
        return generateTreesDeep(1, n)
    }
    
    func generateTreesDeep(_ left: Int, _ right: Int) -> [TreeNode?] {
        
        if left > right {
            return [nil]
        }
        
        var allTree = [TreeNode?]()
        for i in left...right {
            let leftNodes = generateTreesDeep(left, i-1)
            let rightNodes = generateTreesDeep(i+1, right)
            
            for leftNode in leftNodes {
                
                for rightNote in rightNodes {
                    let node = TreeNode.init(i)
                    node.left = leftNode
                    node.right = rightNote
                    allTree.append(node)
                }
                
            }
        }
        return allTree
    }
}

let s = Solution()
let r = s.generateTrees(4).count
