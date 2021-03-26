//
//  304. 二维区域和检索 - 矩阵不可变.swift
//  leetcode-swift
//
//  Created by ylj on 2021/3/2.
//  Copyright © 2021 com. All rights reserved.
//

/*
    First / Best
    关键：前缀和
    时间复杂度：初始化O(n), 检索O(1)
    空间复杂度：O(n)
*/
import Foundation
class NumMatrix {

    var sum:[[Int]]? = nil
    
    init(_ matrix: [[Int]]) {
        
        guard matrix.count > 0 else {
            return
        }
        
        guard matrix[0].count > 0 else {
            return
        }
        
        // 构造前缀和
        var s = 0
        sum = Array.init(repeating: Array.init(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            s = 0
            for j in 0..<matrix[0].count {
                // 水平方向的累计值
                s += matrix[i][j]
                sum[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {

    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
