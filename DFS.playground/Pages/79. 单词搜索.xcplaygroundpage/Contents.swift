/*
    First / Best
    关键：dfs
    时间复杂度：O(mn3^l)
    空间复杂度：O(mn)
*/

class Solution {
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        guard board.count > 0 else {
            return word.count == 0
        }
        
        guard board[0].count > 0 else {
            return word.count == 0
        }
        
        let n = board.count
        let m = board[0].count
        let words = Array(word)
        var visited = Array.init(repeating:Array.init(repeating:0, count:m), count:n)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if dfs(board, &visited, n, m, i, j, words, 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func dfs(_ board: [[Character]], _ visited: inout [[Int]],
             _ n: Int, _ m: Int,
             _ x: Int, _ y: Int,
             _ words: [Character], _ k: Int) -> Bool {
        
        if board[x][y] != words[k] {
            return false
        }
        if k == words.count - 1 {
            return true
        }
        
        visited[x][y] = 1
        
        var result = false
        
        let dts:[(Int, Int)] = [(-1,0),(1,0),(0,-1),(0,1)]
        for dt in dts {
            let nx = x+dt.0
            let ny = y+dt.1
            if nx >= 0, nx < n, ny >= 0, ny < m {
                if visited[nx][ny] == 0 {
                    if dfs(board, &visited, n, m, nx, ny, words, k+1) {
                        result = true
                        break
                    }
                }
            }
        }
        
        visited[x][y] = 0
        
        return result
    }
    
}

let s = Solution()
let r = s.exist([["A","B","C","E"],
                ["S","F","C","S"],
                ["A","D","E","E"]], "ABCCED")
