//
//  1584. 连接所有点的最小费用.swift
//  leetcode-swift
//
//  Created by ylj on 2021/1/19.
//  Copyright © 2021 com. All rights reserved.
//
/*
    First / Best
    关键：
    时间复杂度：O(n^2*logn)
    空间复杂度：O(n^2)
*/
import Foundation
extension Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        
        let n = points.count
        let unionFind = UnionFind1584.init(n)
        var edges = [Edge1584]()
       
        //存储所有边
        for i in 0..<n {
            for j in i+1..<n {
                edges.append(Edge1584.init(dist(points, i, j), i, j))
            }
        }

        //按从小到大排序
        edges.sort { (v1, v2) -> Bool in
            v1.len < v2.len
        }

        var ans = 0
        var num = 1
        for edge in edges {
            let len = edge.len
            if unionFind.union(x: edge.x, y: edge.y) {
                ans += len
                num += 1
                if num == n {
                    break
                }
            }
        }
        return ans
    }
    
    func dist(_ points:[[Int]], _ x: Int, _ y: Int) -> Int {
        return abs(points[x][0] - points[y][0]) + abs(points[x][1] - points[y][1])
    }
}

public class Edge1584 {
    public var len: Int
    public var x: Int
    public var y: Int

    public init(_ len: Int, _ x: Int, _ y: Int) {
        self.len = len
        self.x = x
        self.y = y
    }
}

// 并查集
class UnionFind1584 {
    
    // 连通分量个数
//    private var count: Int
    // 存储树
    private var parents: [Int]
    // 树的权重
    private var size: [Int]
    
    init(_ n: Int) {
        // 初始化根节点
//        count = n
        parents = Array<Int>(0..<n)
        size = Array.init(repeating: 1, count: n)
    }
    
    func union(x: Int, y: Int) -> Bool {
        let rootX = find(node: x)
        let rootY = find(node: y)
        if rootX == rootY {
            return false
        }
        // 大小树平衡优化
        if size[rootX] > size[rootY] {
            parents[rootY] = rootX
            size[rootX] += size[rootY]
        } else {
            parents[rootX] = rootY
            size[rootY] += size[rootX]
        }
//        count -= 1
        return true
    }
    
    func find(node: Int) -> Int {
        var node = node
        while node != parents[node] {
            // 路径压缩
//            parents[node] = parents[parents[node]]
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
