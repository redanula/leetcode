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
    空间复杂度：O(1)
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
    private var parents: [Int]
    
    init(_ size: Int) {
        parents = Array<Int>(0..<size)
    }
    
    func union(x: Int, y: Int) {
        let rootX = find(node: x)
        let rootY = find(node: y)
        parents[rootX] = rootY
    }
    
    func find(node: Int) -> Int {
        if node != parents[node] {
            parents[node] = find(node: parents[node])
        }
        
        return parents[node]
    }
}
