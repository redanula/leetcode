//
//  main.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/4.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

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

let s = Solution()
//let r = s.isPossible([1,2,3,3,4,5,6])
//let r = s.isPossible([1,2,3,4,4,5])
//let r = s.generate(5)
//let r = s.matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]])
//let r = s.splitIntoFibonacci("123456579")
//let r = s.lemonadeChange([5,5,5,10,20])
//let r2 = s.lemonadeChange([5,5,10])
//let r3 = s.lemonadeChange([5,5,10,10,20])
//let r4 = s.lemonadeChange([10,10])
//let r = s.uniquePaths(1, 1)
//let r = s.predictPartyVictory("RD")
//let r2 = s.predictPartyVictory("RDD")
//let r3 = s.predictPartyVictory("DDRRR")
//let r = s.wiggleMaxLength([1,7,4,9,2,5])
//let r = s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
//let r = s.monotoneIncreasingDigits(332)
//let r = s.wordPattern("abba", "dog cat cat dog")
//let r = s.maxProfit([1, 3, 2, 8, 4, 9], 2)
//let r = s.minCostClimbingStairs([10, 15, 20])
//let r = s.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1])
//let r = s.candy([1,2,87,87,87,2,1])
//let r = s.findContentChildren([1,2,3],[1,1])
let r = s.findContentChildren([10,9,8,7],[5,6,7,8])
print(r)
//print(r2)
//print(r3)
//print(r4)
