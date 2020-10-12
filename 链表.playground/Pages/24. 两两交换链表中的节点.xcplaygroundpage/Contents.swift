/*
    关键：迭代
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
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        guard head != nil, head?.next != nil else {
            return head
        }
        
        var p = head
        let ans = head?.next
        var s1:ListNode? = nil
        var s2:ListNode? = nil
        var last:ListNode? = nil
        while p != nil && p?.next != nil {
            s1 = p
            s2 = p?.next
            
            if last != nil {
                last?.next = s2
            }
            
            s1?.next = s2?.next
            s2?.next = s1
            
            last = s1
            p = s1?.next
        }
        
        return ans
    }
}


// 链表
let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
l1.next = l2
l2.next = l3
l3.next = l4
let s = Solution()
let r = s.swapPairs(l1)

var ans = r
while ans != nil {
    print(ans!.val)
    ans = ans?.next
}
