/*
    First
    关键：动态规划。。。边界
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        guard obstacleGrid.count > 0 else {
            return 0
        }
        
        guard obstacleGrid[0].count > 0 else {
            return 0
        }
        
        guard obstacleGrid[0][0] == 0, obstacleGrid[obstacleGrid.count - 1][obstacleGrid[0].count - 1] == 0 else {
            return 0
        }
        
        var dp = Array.init(repeating: Array.init(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        for i in 0..<obstacleGrid.count {
            if obstacleGrid[i][0] == 1 {
                break
            } else {
                dp[i][0] = 1
            }
        }
        
        for i in 0..<obstacleGrid[0].count {
            if obstacleGrid[0][i] == 1 {
                break
            } else {
                dp[0][i] = 1
            }
        }
        
        for i in 1..<obstacleGrid.count {
            for j in 1..<obstacleGrid[i].count {
                dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        return dp[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
    }
}

let s = Solution()
let r = s.uniquePathsWithObstacles([
  [0,0,0],
  [0,1,0],
  [0,0,0]
])
let r2 = s.uniquePathsWithObstacles([[1,0]])
let r3 = s.uniquePathsWithObstacles([[1]])
let r4 = s.uniquePathsWithObstacles([[0,0],[1,1],[0,0]])

