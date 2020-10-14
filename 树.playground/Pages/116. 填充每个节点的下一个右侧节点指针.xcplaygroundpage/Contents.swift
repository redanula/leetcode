/*
    First / Best
    关键：递归
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

public class Node {
     public var val: Int
     public var left: Node?
     public var right: Node?
     public var next: Node?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
         self.next = nil
     }
}

class Solution {
    
    var last:Node? = nil
    
    func connect(_ root: Node?) -> Node? {
        guard root != nil else {
            return nil
        }
        
        var que = [Node?]()
        que.append(root)
        while que.count > 0 {
            let n = que.count;
            var last:Node? = nil
            for i in 1...n {
                let f = que.remove(at: 0)
                if let _ = f?.left {
                    que.append(f?.left)
                }
                if let _ = f?.right {
                    que.append(f?.right)
                }
                if i != 1 {
                    last?.next = f
                }
                last = f
            }
        }
        return root
    }
}
