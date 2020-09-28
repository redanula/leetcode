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

// [1,2,3,4,5,null,7]
// [1,#,2,3,#,4,5,7,#]
let a = Node.init(1)
let al = Node.init(2)
let ar = Node.init(3)
let all = Node.init(4)
let alr = Node.init(5)
let arr = Node.init(7)
a.left = al
a.right = ar
al.left = all
al.right = alr
ar.right = arr
let s = Solution()
let r = s.connect(a)
//print(r!.val)

