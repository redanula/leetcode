/*
    关键：
    时间复杂度：O(n^2)
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
    func insertionSortList(_ head: ListNode?) -> ListNode? {

        // 生成一个前置节点
        let first:ListNode? = ListNode.init(Int.min)
        first?.next = head
        
        var p = head
        var pnext:ListNode? = nil
        while p != nil {
            
            // 记录一下便于恢复
            pnext = p?.next
//            // 断开连接，前面插入排序做结束点
            p?.next = nil
            
            // 找到p的位置
            var q = first?.next
            var qlast:ListNode? = first
            while q != nil {
                // 找到第一个比p大的节点
                if q!.val > p!.val {
                    // 把p放前面
                    qlast?.next = p
                    p?.next = q
                    break
                }
                qlast = q
                q = q?.next
            }
            
            if q == nil {
                qlast?.next = p
                p?.next = nil
            }
            p = pnext
        }
        
        return first?.next
    }
}

// 链表
let l1 = ListNode(4)
let l2 = ListNode(2)
let l3 = ListNode(1)
let l4 = ListNode(3)
l1.next = l2
l2.next = l3
l3.next = l4
let s = Solution()
var i = 0
var ans = s.insertionSortList(l1)
while ans != nil {
    print(ans!.val)
    ans = ans?.next
    i += 1
    if i == 4 {
        break
    }
}
