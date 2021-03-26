//
//  83. 删除排序链表中的重复元素.swift
//  leetcode-swift
//
//  Created by ylj on 2021/3/26.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        let dummy = ListNode(0)
        dummy.next = head
        
        var p = head
        while p?.next != nil {
            if p?.val == p?.next?.val {
                p?.next = p?.next?.next
            } else {
                p = p?.next
            }
        }

        return dummy.next
    }
}
