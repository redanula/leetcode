/*
    54. 螺旋矩阵
    First / Best
    关键：注意越界
    时间复杂度：O(m*n)
    空间复杂度：O(1)
*/

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    guard matrix.count > 0 else {
        return []
    }
    guard matrix[0].count > 0 else {
        return []
    }
    
    var ans = [Int]()
    let row = matrix.count
    let len = matrix[0].count
    var rowmax = row
    var lenmax = len
    var rowmin = 0, lenmin = 0, j = 0
    while lenmin < lenmax, rowmin < rowmax {
        // ->
        j = lenmin
        while j < lenmax {
            ans.append(matrix[rowmin][j])
            j += 1
        }
        rowmin += 1
        
        // ↓
        j = rowmin
        while j < rowmax {
            ans.append(matrix[j][lenmax - 1])
            j += 1
        }
        lenmax -= 1
        
        // ←
        j = lenmax
        while j > lenmin , rowmin != rowmax {
            ans.append(matrix[rowmax - 1][j - 1])
            j -= 1
        }
        rowmax -= 1
        
        // ↑
        j = rowmax
        while j > rowmin , lenmin != lenmax {
            ans.append(matrix[j - 1][lenmin])
            j -= 1
        }
        lenmin += 1
        
    }
    return ans
}

//
let r1 = spiralOrder([[ 1, 2, 3 ],[ 4, 5, 6 ],[ 7, 8, 9 ]])
let r2 = spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
let r3 = spiralOrder([[1,2,3],[4,5,6],[7,8,9],[10,11,12]])
let r4 = spiralOrder([[6,9,7]])
let r5 = spiralOrder([[1,2],[3,4]])
let r6 = spiralOrder([[1],[4],[3]])
print(r1)
print(r2)
print(r3)
print(r4)
print(r5)
print(r6)
