/*
    First / Best
    关键：动态规划
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/
class Solution {
    func minPathSum(_ grid:[[Int]]) -> Int {
        
        guard grid.count > 0 else {
            return 0
        }
        
        guard grid[0].count > 0 else {
            return 0
        }
        
        let m = grid.count
        let n = grid[0].count
        var dp = Array.init(repeating: Array.init(repeating: Int.max, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0, j == 0 {
                    dp[i][j] = grid[0][0]
                } else if i == 0, j > 0 {
                    dp[i][j] = dp[i][j-1] + grid[i][j]
                } else if j == 0, i > 0 {
                    dp[i][j] = dp[i-1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        return dp[m-1][n-1]
    }
}
