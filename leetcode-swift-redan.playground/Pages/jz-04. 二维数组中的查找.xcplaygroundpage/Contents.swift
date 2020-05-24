/*
    jz-04. 二维数组中的查找
    First / Best
    关键：Hash
    时间复杂度：O(m+n)
    空间复杂度：O(1)
*/

func findNumberIn2DArrayFirst(_ matrix: [[Int]], _ target: Int) -> Bool {

    guard matrix.count > 0 else {
        return false
    }
    
    guard matrix[0].count > 0 else {
        return false
    }
    
    var markI = 0
    var markJ = 0
    for i in 0..<matrix.count {
        if matrix[i][0] > target {
            break
        } else if matrix[i][0] < target {
            markI = i
            continue
        } else {
            return true
        }
    }
    
    for j in 0..<matrix[0].count {
        if matrix[0][j] > target {
            break
        } else if matrix[0][j] < target {
            markJ = j
            continue
        } else {
            return true
        }
    }
    
    guard markI > 0, markJ > 0 else {
        return false
    }
    
    for i in 1...markI {
        for j in 1...markJ {
            if matrix[i][j] == target {
                return true
            }
        }
    }
    return false
}

func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.count == 0 { return false }
    var i = 0
    var j = matrix[0].count - 1
    while i < matrix.count && j >= 0 {
        let result = matrix[i][j]
        if result > target {
            j -= 1
        } else if result < target {
            i += 1
        } else {
            return true
        }
    }
    return false
}

let input = [
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]

let input2 = [
  [1,1]
]


let r1 = findNumberIn2DArray(input, 5)
let r2 = findNumberIn2DArray(input, 20)
let r3 = findNumberIn2DArray(input2, 2)
let r4 = findNumberIn2DArray([[]], 2)
