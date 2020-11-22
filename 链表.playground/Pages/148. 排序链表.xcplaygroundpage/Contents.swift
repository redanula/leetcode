/*
    关键：
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
    func sortList(_ head: ListNode?) -> ListNode? {
      return sortList(head, nil)
    }

    private func sortList(_ head:ListNode?, _ tail:ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
  
        if head.next == tail {
            head.next = nil
            return head
        }
    
        var slow:ListNode? = head
        var fast:ListNode? = head
        while fast != tail {
            slow = slow!.next
            fast = fast!.next
            if fast != tail {
                fast = fast!.next
            }
        }
    
        let mid = slow
        let list1 = sortList(head, mid)
        let list2 = sortList(mid, tail)
    
        let sorted = merge(list1, list2)
    
        return sorted
    }


    private func merge(_ head1:ListNode?, _ head2:ListNode?) -> ListNode? {
        let dummyHead = ListNode.init(0)
        var temp = dummyHead
        var temp1 = head1
        var temp2 = head2
    
        while temp1 != nil && temp2 != nil {
            if temp1!.val <= temp2!.val {
                temp.next = temp1
                temp1 = temp1?.next
            } else {
                temp.next = temp2
                temp2 = temp2?.next
            }
            temp = temp.next!
        }
    
        if temp1 != nil {
            temp.next = temp1
        } else if temp2 != nil {
            temp.next = temp2
        }
        return dummyHead.next
    }
}

extension ListNode: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}

