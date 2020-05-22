/*
    105. 从前序与中序遍历序列构造二叉树
    Best
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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    
    guard preorder.count > 0 else {
        return nil
    }
    
    var maps = [Int:Int]()
    // 提前存储根节点
    for i in 0..<inorder.count {
        maps[inorder[i]] = i
    }
    
    return myBuildTree(preorder, 0, preorder.count - 1, 0, preorder.count - 1, maps)
}

func myBuildTree(_ preorder: [Int],_ pb: Int,_ pe: Int,_ ib: Int,_ ie: Int,_ maps:[Int:Int]) -> TreeNode? {
    
    guard pb <= pe else {
        return nil
    }
    
    let rootNote = TreeNode(preorder[pb])
    let rootIndex = maps[preorder[pb]] ?? ib
    let indexP = pb + rootIndex - ib
    
    rootNote.left = myBuildTree(preorder, pb+1, indexP, ib, rootIndex-1, maps)
    rootNote.right = myBuildTree(preorder, indexP+1, pe, rootIndex+1, ie, maps)
    return rootNote
}


let preorder = [3,9,20,15,7]
let inorder = [9,3,15,20,7]
let r = buildTree(preorder,inorder)
