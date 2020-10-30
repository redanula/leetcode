/*
    First / Best
    关键：
    时间复杂度：O(nm)
    空间复杂度：O(1)
*/
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        
        guard grid[0].count > 0 else {
            return 0
        }
        
        var ans = 0
        
        let dp = [(0,1),(0,-1),(1,0),(-1,0)]
        let n = grid.count
        let m = grid[0].count
        
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 1 {
                    ans += 4
                    for k in 0..<dp.count {
                        let ni = i + dp[k].0
                        let nj = j + dp[k].1
                        if ni >= 0, ni < n, nj >= 0, nj < m {
                            if grid[ni][nj] == 1 {
                                ans -= 1
                            }
                        }
                    }
                }
            }
        }
        return ans
    }
}

let s = Solution()
let r = s.islandPerimeter(
[[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]])
