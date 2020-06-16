/*
    297. 二叉树的序列化与反序列化
    First / Best
    关键：BFS / DFS
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


class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        
        return serializeTree(root, "")
    }
    
    func serializeTree(_ root: TreeNode?, _ str: String) -> String {
        var rStr = str
        if root == nil {
            rStr += "null,"
        } else {
            rStr += String(root!.val) + ","
            rStr = serializeTree(root?.left, rStr)
            rStr = serializeTree(root?.right, rStr)
        }
     
        return rStr;
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var strArray = data.split(separator: ",")
        return deserializeTree(&strArray)
    }
    
    func deserializeTree(_ strArray:inout [Substring]) -> TreeNode? {
        
        if (strArray[0] == "null") {
            strArray.remove(at: 0);
            return nil;
        }
  
        let node = TreeNode(Int(strArray[0])!)
        strArray.remove(at: 0)
        node.left = deserializeTree(&strArray)
        node.right = deserializeTree(&strArray)
        return node
    }
}

 
let a = TreeNode.init(1)
let al = TreeNode.init(2)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
a.left = al
a.right = ar
ar.left = all
ar.right = alr

var codec = Codec()
let s = codec.serialize(a)
let r = codec.serialize(codec.deserialize(s))

//let r = codec.deserialize(codec.serialize(a))
