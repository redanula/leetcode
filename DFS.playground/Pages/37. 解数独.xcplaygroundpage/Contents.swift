/*
    First
    关键：dfs
    时间复杂度：O()
    空间复杂度：O()
*/


class Solution {
    
    func solveSudoku(_ board: inout [[Character]]) {
        
        let n = board.count
        let m = board[0].count
        var stack = [(Int, Int)]()
        
        // 记录需要填充的数字
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == "." {
                    stack.append((i,j))
                }
            }
        }
        
        let first = stack.popLast()
        for k in 1...9 {
            let r = mark(&board, first!.0, first!.1, k, &stack)
            if r == true {
                return
            }
        }
        
    }
    
    // 判断num是否可以标记在x,y的位置，能则并标记并返回：行列九宫格
    func mark(_ board: inout [[Character]],
              _ x: Int, _ y: Int,
              _ num: Int,
              _ stack: inout [(Int, Int)]) -> Bool{
        
        var result = false
        
        // 行
        for i in 0..<9 {
            if i != x {
                if board[i][y] != ".", Int(String(board[i][y])) == num {
                    return false
                }
            }
        }
        // 列
        for j in 0..<9 {
            if j != y {
                if board[x][j] != ".", Int(String(board[x][j])) == num {
                    return false
                }
            }
        }
        // 九宫格
        let x9 = x/3
        let y9 = y/3
        for i in (x9*3)...(x9*3)+2 {
            for j in (y9*3)...(y9*3)+2 {
                if x9 != x, y9 != y, board[i][j] != "." {
                    if Int(String(board[i][j])) == num {
                        return false
                    }
                }
            }
        }
        
        board[x][y] = Character(String(num))
        
        // 找下一个填充位置
        let tmpStack = stack
        while stack.count > 0 {
            let next = stack.popLast()
            var r = false
            let tmp = board
            for k in 1...9 {
                r = mark(&board, next!.0, next!.1, k, &stack)
                if r == true {
                    break
                } else {
                    // 下级填充有问题，需要回溯
                    board = tmp
                }
            }
            
            if r == false {
                stack = tmpStack
                break
            }
        }
        if stack.count == 0 {
            result = true
        } else {
            result = false
        }
        
        return result
    }
}

let s = Solution()
var a:[[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

let r = s.solveSudoku(&a)
