/*
    关键：快慢指针
    时间复杂度：O(n)
    空间复杂度：O(1)
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
    func hasCycle(_ head: ListNode?) -> Bool {

        guard head != nil else {
            return false
        }

        var fast = head?.next
        var slow = head
        while fast?.val != slow?.val, fast != nil, slow != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return fast?.val == slow?.val
    }
}

