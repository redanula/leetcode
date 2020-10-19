/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        var stack = [ListNode]()
        var p = head
        var c = 0
        while p != nil {
            stack.append(p!)
            p = p?.next
            c += 1
        }

        p = head
        var tail:ListNode? = nil
        while stack.count > c/2 {
            tail = stack.popLast()
            let tmp = p?.next
            p?.next = tail
            tail?.next = tmp
            p = tmp
        }
        
        if c % 2 == 1 {
            tail?.next = nil
        } else {
            tail?.next?.next = nil
        }
    }
}
