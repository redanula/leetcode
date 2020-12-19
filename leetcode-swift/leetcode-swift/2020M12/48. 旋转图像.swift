//
//  48. 旋转图像.swift
//  leetcode-swift
//
//  Created by ylj on 2020/12/19.
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
    
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // 水平翻转
        for i in 0..<n/2 {
            for j in 0..<n {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[n-i-1][j]
                matrix[n-i-1][j] = temp
            }
        }
        // 主对角线翻转
        for i in 0..<n {
            for j in 0..<i {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
}
