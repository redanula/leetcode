/*
    关键：快慢指针
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        var stack = [ListNode]()
        var p = head
        while p != nil {
            stack.append(p!)
            p = p?.next
        }
        
        p = head
        while stack.count > 0 {
            let t = stack.popLast()
            if p?.val == t?.val {
                p = p?.next
                continue
            } else {
                return false
            }
        }
        
        return true
    }
}
