/*
    First / Best
    关键：dfs
    时间复杂度：O(n)
    空间复杂度：O(n)
*/


public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    
    var maps = [Int: Node?]()
    
    func cloneGraph(_ node: Node?) -> Node? {
        return dfs(node)
    }
    
    func dfs(_ node: Node?) -> Node? {
        
        guard let n = node else {
            return node
        }
        
        if let existedNode = maps[n.val] {
            return existedNode
        }
        
        let cloneNode = Node.init(n.val)
        maps[cloneNode.val] = cloneNode
        
        for item in n.neighbors {
            cloneNode.neighbors.append(dfs(item))
        }
        
        return cloneNode
    }
}

