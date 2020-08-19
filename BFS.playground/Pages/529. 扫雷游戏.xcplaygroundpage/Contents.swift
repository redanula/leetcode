/*
    Best
    关键：广度优先
    时间复杂度：O(nm)
    空间复杂度：O(nm)
*/

class Solution {
    
    let dir_x:[Int] = [0, 1, 0, -1, 1, 1, -1, -1]
    let dir_y:[Int] = [1, 0, -1, 0, 1, -1, 1, -1]
    
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        
        guard board.count > 0 else {
            return [[]]
        }
        
        guard board[0].count > 0 else {
            return [[]]
        }
        
        var ans = board
        var stack = [(Int, Int)]()
        let n = board.count
        let m = board[0].count
        
        if ans[click[0]][click[1]] == "M" {
            ans[click[0]][click[1]] = "X"
        } else {
            openPosition(&ans, &stack, (click[0], click[1]), n, m)
            while stack.count > 0 {
                if let p = stack.popLast() {
                    for i in 0..<8 {
                        let dx = p.0 + dir_x[i]
                        let dy = p.1 + dir_y[i]
                        openPosition(&ans, &stack, (dx, dy), n, m)
                    }
                }
            }
        }
        
        return ans
    }
    
    func openPosition(_ ans: inout [[Character]],
                      _ stack: inout [(Int, Int)],
                      _ p:(Int, Int),
                      _ n: Int,
                      _ m: Int) {
        
        if p.0 < 0 || p.0 >= n || p.1 < 0 || p.1 >= m {
            return
        }
        
        if ans[p.0][p.1] == "E" {
            var countM = 0
            for i in 0..<8 {
                let dx = p.0 + dir_x[i]
                let dy = p.1 + dir_y[i]
                if dx < 0 || dx >= n || dy < 0 || dy >= m {
                    continue
                }
                if ans[dx][dy] == "M" {
                    countM += 1
                }
            }
            if countM > 0 {
                ans[p.0][p.1] = Character(String(countM))
            } else {
                ans[p.0][p.1] = "B"
                stack.append(p)
            }
        }
    }
}


let s = Solution()
let r = s.updateBoard(
[["E", "E", "E", "E", "E"],
 ["E", "E", "M", "E", "E"],
 ["E", "E", "E", "E", "E"],
 ["E", "E", "E", "E", "E"]]
, [3, 0])
