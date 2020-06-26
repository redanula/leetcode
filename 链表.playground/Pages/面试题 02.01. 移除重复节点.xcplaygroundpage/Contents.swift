/*
    First / Best
    关键：哈希
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
    var map = [Int: Int]()
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        
        var p = head
        var last = head
        while p != nil {
            if map[p!.val] == 1 {
                p = p?.next
                last?.next = p
            } else {
                map[p!.val] = 1
                last = p
                p = p?.next
            }
        }
        
        return head
    }
}


// 链表
let l1 = ListNode(1)
let l2 = ListNode(3)
let l3 = ListNode(2)
l1.next = l2
l2.next = l3

var s = Solution()
var ans = s.removeDuplicateNodes(l1)
while ans != nil {
    print(ans!.val)
    ans = ans?.next
}
