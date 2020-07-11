/*
    680. 验证回文字符串 Ⅱ
    First / Best
    关键：
    时间复杂度：
    空间复杂度：
*/

//let s = Solution()
//let r = s.maxProfit([1,2,3,0,2])


/*
// 二维数组
let input = [
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]

let input2 = [
  [1,1]
]
 

// 链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
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

// 树
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 
 
let a = TreeNode.init(2)
let al = TreeNode.init(1)
let ar = TreeNode.init(3)
let all = TreeNode.init(4)
let alr = TreeNode.init(5)
a.left = al
a.right = ar
al.left = all
al.right = alr
let r = levelOrder(a)

func test(_ node: TreeNode?) {
  let n = node
  if n != nil {
      print("\(n!.val)")
      test(n!.left)
      test(n!.right)
  }
}

let s = Solution()
let r = s.sortedArrayToBST([-10,-3,0,5,9])
let r2 = s.sortedArrayToBST([1,2,3,4,5,6,7])
test(r)


 
*/
