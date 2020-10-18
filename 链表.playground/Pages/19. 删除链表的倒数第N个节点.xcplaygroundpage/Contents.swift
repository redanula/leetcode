/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var stack = [ListNode?]()
        var p = head
        
        while p != nil {
            stack.append(p)
            p = p?.next
        }
        
        var i = 0
        var last:ListNode? = nil
        while i < n {
            last = stack.popLast()!
            i += 1
        }
        
        p = head
        if (stack.count > 0) {
            let tmp = stack.popLast()!
            tmp?.next = last?.next
        } else {
            p = nil
        }
        
        return p
    }
}

//let s = Solution()
//let r = s.removeNthFromEnd(<#T##head: ListNode?##ListNode?#>, <#T##n: Int##Int#>)
