/*
    221. 最大正方形
    First / Best
    关键：动态规划
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/

func maximalSquare(_ matrix: [[Character]]) -> Int {
    
    guard matrix.count > 0, matrix[0].count > 0 else {
        return 0
    }
    
    let v = matrix.count
    let h = matrix[0].count
    var dpMap:[[Int]] = Array(repeating: Array(repeating: 0, count: h), count: v)
    var maxLine = 0
    
    for i in 0..<v {
        for j in 0..<h {
            if matrix[i][j] == "0" {
                continue
            } else if i == 0 || j == 0 {
                dpMap[i][j] = 1
            } else {
                // dp方程
                dpMap[i][j] = min(dpMap[i-1][j-1],dpMap[i-1][j],dpMap[i][j-1]) + 1
            }
            if dpMap[i][j] > maxLine {
                maxLine = dpMap[i][j]
            }
        }
    }
    
    return maxLine * maxLine
}

let m: [[Character]] = [["0","1","1"]]
let c = maximalSquare(m)
