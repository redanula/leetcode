/*
    102. 二叉树的层序遍历
    First / Bset
    关键：DFS(如下) 或 BFS
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

var list = [[Int]]()

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    levelWithDindex(root,index: 0)
    return list
}

func levelWithDindex(_ root: TreeNode?, index: Int) {
    
    if root == nil {
        return
    }
    
    if list.count > index {
        list[index].append(root!.val)
    }else {
        list.append([root!.val])
    }
    
    let dIndex = index + 1
    levelWithDindex(root?.left, index:dIndex)
    levelWithDindex(root?.right, index:dIndex)
    
}


// case 1
let a = TreeNode.init(2)
let al = TreeNode.init(1)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
a.left = al
a.right = ar
al.left = all
al.right = alr
let r = levelOrder(a)
