/*
    25. K 个一组翻转链表
    First / Bset
    关键：
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
    
    var kArray = Array.init(repeating: ListNode.init(0), count: k)
    var pre = head
    repeat {
        for i in 0 ..< k {
            if let next = pre {
                kArray[i] = next
            }else {
                break
            }
        }
        
        if kArray.count == k {
            kArray[0].next = kArray[k-1].next
            for i in 0 ..< k - 1 {
                kArray[k-1-i].next = kArray[k-2-i]
            }
            pre = kArray[0].next
        } else {
            break
        }
        
        
    } while pre != nil
    
    
    return head
    
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
