/*
    146. LRU缓存机制
    Best
    关键：双向链表、Hash、删除节点、移动到Head
    时间复杂度：O(1)
    空间复杂度：O(n)
*/

public class ListNode {
    public var key: Int
    public var val: Int
    public var next: ListNode?
    public var pre: ListNode?
    public init(_ key: Int, _ val: Int) {
        self.val = val
        self.key = key
        self.next = nil
        self.pre = nil
    }
}

class LRUCache {
    
    var map:[Int:ListNode]
    var maxLen:Int
    var len:Int
    var head:ListNode
    var tail:ListNode
    
    init(_ capacity: Int) {
        maxLen = capacity
        len = 0
        // 构造dummy节点
        head = ListNode(0, 0)
        tail = ListNode(0, 0)
        head.next = tail
        tail.pre = head
        map = [Int:ListNode]()
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            // 更新最近使用key
            // 把node放在head
            moveToHead(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {

        if let node = map[key] {
            // 把node放在head
            node.val = value
            moveToHead(node)
        } else {
            
            len += 1
            let node = ListNode(key, value)
            addToHead(node)
            map[key] = node
        
            if len > maxLen {
                let oldNode = removeTail()
                // 释放空间
                map[oldNode.key] = nil
                len -= 1
            }
        }
    }
    
    func removeNode(_ node: ListNode) {
        node.next?.pre = node.pre
        node.pre?.next = node.next
    }
    
    func addToHead(_ node: ListNode) {
        node.pre = head
        node.next = head.next
        head.next?.pre = node
        head.next = node
    }
    
    func moveToHead(_ node: ListNode) {
        removeNode(node)
        addToHead(node)
    }
    
    func removeTail() -> ListNode {
        let node = tail.pre
        removeNode(node!)
        return node!
    }
}

let obj = LRUCache(2)
obj.put(1, 1);
obj.put(2, 2);
let ret_1: Int = obj.get(1);       // 返回  1
obj.put(3, 3);    // 该操作会使得密钥 2 作废
let ret_2: Int = obj.get(2);       // 返回 -1 (未找到)
obj.put(4, 4);    // 该操作会使得密钥 1 作废
let ret_3: Int = obj.get(1);       // 返回 -1 (未找到)
let ret_4: Int = obj.get(3);       // 返回  3
let ret_5: Int = obj.get(4);       // 返回  4
