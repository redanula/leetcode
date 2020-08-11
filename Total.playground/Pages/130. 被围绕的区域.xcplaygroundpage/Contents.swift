/*
    First / Best
    关键：dfs
    时间复杂度：O(n*m)
    空间复杂度：O(n*m)
*/

class Solution {
    func solve(_ board: inout [[Character]]) {
        guard board.count > 2 else {
            return
        }
        guard board[0].count > 2 else {
            return
        }
        
        for i in 0..<board.count {
            dfs(&board, i, 0);
            dfs(&board, i, board[0].count-1);
        }
        
        for i in 1..<board[0].count-1 {
            dfs(&board, 0, i);
            dfs(&board, board.count-1, i);
        }
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "A" {
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    func dfs(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        
        guard x >= 0, y >= 0, x < board.count, y < board[0].count, board[x][y] == "O" else {
            return
        }
        
        board[x][y] = "A"
        dfs(&board, x + 1, y)
        dfs(&board, x - 1, y)
        dfs(&board, x, y + 1)
        dfs(&board, x, y - 1)
    }
}

let s = Solution()
//var c:[[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
var c:[[Character]] = [["O","O","O"],["O","O","O"],["O","O","O"]]
s.solve(&c)
print(c)
