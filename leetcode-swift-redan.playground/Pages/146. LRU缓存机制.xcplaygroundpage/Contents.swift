/*
    146. LRU缓存机制
    Best
    关键：双向链表
    时间复杂度：O(1)
    空间复杂度：O(n)
*/

class LRUCache {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public var pre: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
            self.pre = nil
        }
    }
    
    var map = [Int:ListNode]()
    var maxLen = 0
    var len = 0
    var head:ListNode? = nil
    var tail:ListNode? = nil
    
    init(_ capacity: Int) {
        maxLen = capacity
        len = 0
        head = nil
        tail = nil
    }
    
    func get(_ key: Int) -> Int {
        
        if let node = map[key] {
            // 更新最近使用key
            // 把node放在head
            moveNodeToHead(node)
            return head!.val
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {

        if let node = map[key] {
            // 把node放在head
            node.val = value
//            print(value)
            moveNodeToHead(node)
            map[key] = head
        } else {
            if len == maxLen {
                
                if tail != nil {
                    let oldValue = tail!.val
//                    print(oldValue)
                    tail!.pre?.next = nil
                    
                    // 释放空间
                    map[oldValue] = nil
                    tail = tail!.pre
                }
                let node = ListNode(value)
                moveNodeToHead(node)
                map[key] = head
            } else {
                len += 1
                let node = ListNode(value)
                moveNodeToHead(node)
                map[key] = head
//                print(key)
                if tail == nil {
//                    print("tail")
                    tail = head
                }
            }
        }
    }
    
    func moveNodeToHead(_ node: ListNode) {
        if let nextNode = node.next {
            nextNode.pre = node.pre
        } else {
            tail = head
        }
        
        if let preNode = node.pre {
           preNode.next = node.next
        }
        
        head?.pre = node
        node.pre = nil
        node.next = head
        
        head = node
    }
}

let obj = LRUCache(1)
obj.put(1, 1);
obj.put(2, 2);
let ret_1: Int = obj.get(1);       // 返回  1
obj.put(3, 3);    // 该操作会使得密钥 2 作废
let ret_2: Int = obj.get(2);       // 返回 -1 (未找到)
obj.put(4, 4);    // 该操作会使得密钥 1 作废
let ret_3: Int = obj.get(1);       // 返回 -1 (未找到)
let ret_4: Int = obj.get(3);       // 返回  3
let ret_5: Int = obj.get(4);       // 返回  4
