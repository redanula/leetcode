//
//  316. 去除重复字母.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/20.
//  Copyright © 2020 com. All rights reserved.
//
/*
    First / Best
    关键：Hash
    时间复杂度：O(n^2)
    空间复杂度：O(1)
*/
import Foundation
extension Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]()
        // 记录最后一个位置，不做弹栈
        var lastIndexs = [Int](repeating: 0, count: 26)
        let aAsciiValue = ("a" as Character).asciiValue!
        for (i, c) in s.enumerated() {
            lastIndexs[Int(c.asciiValue! - aAsciiValue)] = i
        }
        var visited = [Bool](repeating: false, count: 26)
        for (i, c) in s.enumerated() {
            let curAsciiOffset = Int(c.asciiValue! - aAsciiValue)
            guard !visited[curAsciiOffset] else { continue }
            while let top = stack.last, top > c, lastIndexs[Int(top.asciiValue! - aAsciiValue)] >= i {
                let poped = stack.popLast()!
                visited[Int(poped.asciiValue! - aAsciiValue)] = false
            }
            stack.append(c)
            visited[curAsciiOffset] = true
        }
        return String(stack)

    }
}
