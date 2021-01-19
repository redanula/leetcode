//
//  721. 账户合并.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/18.
//  Copyright © 2021 com. All rights reserved.
//

/*
    First / Best
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/
import Foundation

extension Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailToIndex = [String: Int]()
        var emailToName = [String: String]()
        var emailsCount = 0
        
        for account in accounts {
            let name = account[0]
            let size = account.count
            for i in 1..<size {
                let email = account[i]
                if !emailToIndex.keys.contains(email) {
                    emailToIndex[email] = emailsCount
                    emailsCount += 1
                    emailToName[email] = name
                }
            }
        }

        let unionFind = UnionFind.init(emailsCount)
        for account in accounts {
            let firstEmail = account[1]
            let firstIndex = emailToIndex[firstEmail]!
            let size = account.count
            for i in 2..<size {
                let nextEmail = account[i]
                let nextIndex = emailToIndex[nextEmail]!
                unionFind.union(x: firstIndex, y: nextIndex)
            }
        }

        var indexToEmails = [Int: [String]]()
        for email in emailToIndex.keys {
            let index = unionFind.find(node: emailToIndex[email]!)
            var account = [String]()
            if let list = indexToEmails[index] {
                account = list
            }
            account.append(email)
            indexToEmails[index] = account
        }
        
        var merged = [[String]]()
        for emails in indexToEmails.values {
            let sortEmails = emails.sorted()
            let name = emailToName[sortEmails[0]]!
            var account = [String]()
            account.append(name)
            account.append(contentsOf: sortEmails)
            merged.append(account)
        }
        return merged
    }
}

// 并查集
class UnionFind {
    
    // 连通分量个数
    private var count: Int
    // 存储树
    private var parents: [Int]
    // 树的权重
    private var size: [Int]
    
    init(_ n: Int) {
        // 初始化根节点
        count = n
        parents = Array<Int>(0..<count)
        size = Array.init(repeating: 1, count: count)
    }
    
    func union(x: Int, y: Int) {
        let rootX = find(node: x)
        let rootY = find(node: y)
        if rootX == rootY {
            return
        }
        // 大小树平衡优化
        if size[rootX] > size[rootY] {
            parents[rootY] = rootX
            size[rootX] += size[rootY]
        } else {
            parents[rootX] = rootY
            size[rootY] += size[rootX]
        }
        count -= 1
    }
    
    func find(node: Int) -> Int {
        var node = node
        while node != parents[node] {
            // 路径压缩
            parents[node] = parents[parents[node]]
            node = parents[node]
        }
        
        return node
    }
    
    func connected(x: Int, y: Int) -> Bool {
        let rootX = find(node: x)
        let rootY = find(node: y)
        return rootX == rootY
    }
}
