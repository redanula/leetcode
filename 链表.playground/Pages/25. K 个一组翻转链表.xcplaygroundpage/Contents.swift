/*
    25. K 个一组翻转链表
    Bset
    关键：翻转子链表、生成一个preHead巧妙解决Head第一个翻转后要找回的问题
    时间复杂度：O(n + k)
    空间复杂度：O(k)

*/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    guard let head = head else {
        return nil
    }
    
    let preHead = ListNode.init(0)
    preHead.next = head
    
    var pre: ListNode? = preHead
    var end: ListNode? = preHead
    while end?.next != nil {
        for _ in 0 ..< k {
            end = end?.next
        }
        if end == nil {
            break
        }
        
        let start = pre?.next
        let endNext = end?.next
        end?.next = nil // 断开后才能翻转
        pre?.next = reverseNode(start)
        start?.next = endNext
        pre = start
        end = pre
    }
    return preHead.next
    
}

func reverseNode(_ head: ListNode?) -> ListNode? {
    var pre: ListNode?
    var cur = head
    while cur != nil {
        let tempNext = cur!.next // 记录下个节点
        cur!.next = pre // 修改next指向
        pre = cur // 存储当前节点
        cur = tempNext // 修改遍历位置，从下个节点开始
    }
    return pre
}


// case 1
let t1 = ListNode.init(1)
let t2 = ListNode.init(2)
let t3 = ListNode.init(3)
let t4 = ListNode.init(4)
let t5 = ListNode.init(5)
//let t6 = ListNode.init(6)
//let t7 = ListNode.init(7)
//let t8 = ListNode.init(8)
t1.next = t2
t2.next = t3
t3.next = t4
t4.next = t5
//t5.next = t6
//t6.next = t7
//t7.next = t8
let r = reverseKGroup(t1, 5)
