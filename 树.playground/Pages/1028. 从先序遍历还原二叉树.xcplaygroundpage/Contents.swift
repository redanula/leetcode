/*
    1028. 从先序遍历还原二叉树
    First / Best
    关键：枚举 (A[i] + i) + (A[j] - j)
    时间复杂度：O(s)
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

var dindex = 0

func recoverFromPreorder(_ S: String) -> TreeNode? {
    let sArray = Array(S)
    return dfs(sArray, 0)
}

func dfs(_ sArray: [Character], _ nextDeep: Int) -> TreeNode? {
    
    if dindex >= sArray.count {
        return nil
    }
    var deep = 0
    var tmp = dindex
    while tmp < sArray.count, sArray[tmp] == "-" {
        tmp += 1
        deep += 1
    }
    
    if nextDeep != deep {
        return nil
    }
    
    dindex = tmp
    
    var val = 0
    while dindex < sArray.count, sArray[dindex] != "-" {
        val = val * 10 + Int(String(sArray[dindex]))!
        dindex += 1
    }
    
    let node = TreeNode.init(val)
    node.left = dfs(sArray, deep + 1)
    node.right = dfs(sArray, deep + 1)
    
    return node
}

let r = recoverFromPreorder("1-401--349---90--88")
