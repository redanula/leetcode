/*
    Best
    关键：分支、中序遍历
    时间复杂度：O(n)
    空间复杂度：O(logn)
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        let len = getLength(head)
        var p = head
        return buildTree(&p, 0, len - 1)
    }
    
    func getLength(_ head: ListNode?) -> Int {
        var ret = 0
        var p = head
        while p != nil {
            ret += 1
            p = p?.next
        }
        return ret
    }
    
    func buildTree(_ head: inout ListNode?, _ left: Int, _ right: Int) -> TreeNode? {
        if (left > right) {
            return nil
        }
        let mid = (left + right + 1) / 2
        let root = TreeNode.init()
        root.left = buildTree(&head, left, mid - 1)
        root.val = head!.val
        head = head?.next
        root.right = buildTree(&head, mid + 1, right)
        return root
    }
}
