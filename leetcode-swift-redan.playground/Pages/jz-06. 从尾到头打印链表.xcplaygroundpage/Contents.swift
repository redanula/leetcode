/*
    jz-06. 从尾到头打印链表
    First / Best
    关键：递归，插入顺序
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


func reversePrint(_ head: ListNode?) -> [Int] {
    var ans = [Int]()
    reverseAdd(head, &ans)
    return ans
}

func reverseAdd(_ head: ListNode?, _ array:inout [Int]) {
    guard head != nil else {
        return
    }
    reverseAdd(head?.next, &array)
    array.append(head!.val)
}

// 链表
let l1 = ListNode(1)
let l2 = ListNode(3)
let l3 = ListNode(2)
l1.next = l2
l2.next = l3

var ans = reversePrint(l1)
