/*
    关键：快慢指针
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
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        
        guard head != nil else {
            return nil
        }
        
        guard head?.next != nil else {
            return head
        }
        
        var p1 = head
        var p2 = head?.next
        let savep2 = p2
        
        while p2 != nil, p2?.next != nil {
            p1?.next = p1?.next?.next
            p1 = p1?.next

            p2?.next = p1?.next
            p2 = p2?.next
        }
        
        p1?.next = savep2
        
        return head
    }
}

let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
let l5 = ListNode(5)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
let s = Solution()
var ans = s.oddEvenList(l1)
while ans != nil {
    print(ans!.val)
    ans = ans?.next
}
