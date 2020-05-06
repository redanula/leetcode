/*
    98. 验证二叉搜索树
    First / Best
    关键：递归
    时间复杂度：O(m+n)
    空间复杂度：O(1)
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

func isValidBST(_ root: TreeNode?) -> Bool {
    let maxV:Int? = nil
    let minV:Int? = nil
    let rootNote = root
    let result = isValidBSTWithRange(rootNote, maxV:maxV, minV:minV)
    
    return result
}

func isValidBSTWithRange(_ root: TreeNode?, maxV: Int?, minV: Int?) -> Bool {
    var result = true
    
    if root == nil {
        return true
    }
    
    let currentRoot = root
    let rootVal = currentRoot?.val

    if let leftNode = currentRoot?.left {
        if  (result && leftNode.val < rootVal! && (minV == nil || leftNode.val > minV!)) {
            let lmaxV = rootVal
            result = result && isValidBSTWithRange(leftNode, maxV:lmaxV, minV:minV)
        }else {
            result = false
        }
    }
    
    if let rightNode = currentRoot?.right {
        if (result && rightNode.val > rootVal! && (maxV == nil || rightNode.val < maxV!)) {
            let minV = rootVal
            result = result && isValidBSTWithRange(rightNode, maxV:maxV, minV:minV)
        }else {
            result = false
        }
    }
    return result
}

// case 1
let a = TreeNode.init(2)
let al = TreeNode.init(1)
let ar = TreeNode.init(3)
a.left = al
a.right = ar
let r = isValidBST(a)

// case 2
//let a = TreeNode.init(3)
//let al = TreeNode.init(1)
//let ar = TreeNode.init(5)
//let all = TreeNode.init(0)
//let alr = TreeNode.init(2)
//let arl = TreeNode.init(4)
//let arr = TreeNode.init(6)
//a.left = al
//a.right = ar
//al.left = all
//al.right = alr
//ar.left = arl
//ar.right = arr
//let r = isValidBST(a)
//print(r)
