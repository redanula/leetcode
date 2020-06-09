/*
    2. 两数相加
    First / Best
    关键：
    时间复杂度：O(l1+l2)
    空间复杂度：O(max(l1,l2)+1)
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    return add(l1, l2, 0)
}

func add(_ l1: ListNode?, _ l2: ListNode?, _ opp: Int) -> ListNode? {
    
    if l1 == nil && opp == 0 {
        return l2
    }
    
    if l2 == nil && opp == 0 {
        return l1
    }
    
    let v1 = l1 == nil ? 0 : l1!.val
    let v2 = l2 == nil ? 0 : l2!.val
    let value = v1 + v2 + opp
    let l = ListNode(value%10)
    l.next = add(l1?.next, l2?.next, value >= 10 ? 1 : 0)
    return l
}

let l1 = ListNode(2)
let l2 = ListNode(4)
let l3 = ListNode(3)
l1.next = l2
l2.next = l3

let r1 = ListNode(5)
let r2 = ListNode(6)
let r3 = ListNode(4)
r1.next = r2
r2.next = r3

var ans = addTwoNumbers(l1,r1)
while ans != nil {
    print(ans!.val)
    ans = ans?.next
}
