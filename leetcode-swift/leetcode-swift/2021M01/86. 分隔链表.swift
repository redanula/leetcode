//
//  86. 分隔链表.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/3.
//  Copyright © 2021 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
import Foundation

extension Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        let xNode = ListNode(x)
        var xLeft:ListNode? = nil
        var xRight:ListNode? = nil
        var tmpLeft:ListNode? = nil
        var tmpRight:ListNode? = nil
        var p = head
        while p != nil {
            if p!.val < x {
                if xLeft == nil {
                    xLeft = p
                    tmpLeft = xLeft
                } else {
                    xLeft?.next = p
                    xLeft = p
                }
            } else {
                if xRight == nil {
                    xRight = p
                    tmpRight = xRight
                } else {
                    xRight?.next = p
                    xRight = p
                }
            }
            
            p = p?.next
        }
        
        if xLeft != nil {
            xLeft?.next = tmpRight
        } else {
            xLeft = tmpRight
        }
        
        if xRight != nil {
            xRight?.next = nil
        }
        
        if tmpLeft == nil {
            tmpLeft = tmpRight
        }
        
        return tmpLeft
    }
}
