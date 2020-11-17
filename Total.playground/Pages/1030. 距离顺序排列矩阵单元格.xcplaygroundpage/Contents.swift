/*
    First
    关键：
    时间复杂度：O(R*C)
    空间复杂度：O(R*C)
*/

class Solution {
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        
        let d1 = [(1,0), (0,1), (-1,0), (0,-1)]
        
        var visited = Array.init(repeating: Array.init(repeating: 0, count: C), count: R)
        var queue = [(Int, Int)]()
        var ans = [[Int]]()
        
        queue.append((r0, c0))
        ans.append([r0,c0])
        visited[r0][c0] = 1
        while queue.count > 0 {
            let last = queue.removeFirst()
            
            for i in 0..<4 {
                let x = last.0 + d1[i].0
                let y = last.1 + d1[i].1
                if x>=0, x<R, y>=0, y<C {
                    if visited[x][y] == 0 {
                        queue.append((x,y))
                        ans.append([x,y])
                        visited[x][y] = 1
                    }
                }
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.allCellsDistOrder(2,3,1,2)
//let r2 = s.allCellsDistOrder(1,2,0,0)
// [[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
