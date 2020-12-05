//
//  621. 任务调度器.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/5.
//  Copyright © 2020 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(task*26log26)
    空间复杂度：O(task)
*/

extension Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var kinds: [Int] = [Int](repeating: 0, count: 26)
        let a: Int = Int(String("A").unicodeScalars.first!.value)
        for task in tasks {
            let char = Int(String(task).unicodeScalars.first!.value)
            kinds[char-a] += 1
        }
        kinds.sort()
        var time = 0
        while kinds[25] > 0 {
            for i in 0...n {
                if kinds[25] == 0 {
                    break
                }
                if i < 26 && kinds[25 - i] > 0 {
                    kinds[25-i] -= 1
                }
                time += 1
            }
            kinds.sort()
        }
        return time
    }
}
