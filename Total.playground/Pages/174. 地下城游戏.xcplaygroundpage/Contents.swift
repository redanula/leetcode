/*
    First / Best
    关键：动态规划, 无后效性
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/

class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        
        guard dungeon.count > 0 else {
            return 0
        }
        
        guard dungeon[0].count > 0 else {
            return 0
        }
        
        let n = dungeon.count
        let m = dungeon[0].count
        var dp = Array.init(repeating: Array.init(repeating: Int.max, count: m + 1), count: n + 1)
        dp[n][m - 1] = 1
        dp[n - 1][m] = 1
        for i in (0...n-1).reversed() {
            for j in (0...m-1).reversed() {
                let minn = min(dp[i + 1][j], dp[i][j + 1])
                dp[i][j] = max(minn - dungeon[i][j], 1)
            }
        }
       
//        print(dp)
        return dp[0][0]
    }
}
let s = Solution()
//let r = s.calculateMinimumHP([[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]])
let r2 = s.calculateMinimumHP([[-2,-3,3],[-5,-10,1],[10,30,-5]])
