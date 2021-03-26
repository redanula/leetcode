//
//  92. 反转链表 II.swift
//  leetcode-swift
//
//  Created by ylj on 2021/3/18.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
extension Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {

        let dummy = ListNode(0)
        dummy.next = head
                
        var pre: ListNode? = dummy
        for _ in 0..<left - 1 {
            pre = pre?.next
        }
        let current = pre?.next
        for _ in left..<right {
            let next = current?.next
            current?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        return dummy.next

    }
}
