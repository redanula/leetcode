/*
    First / Best
    关键：动态规划, 滚动数组
    时间复杂度：O(n2)
    空间复杂度：O(n2), 滚动数组可到O(n)
*/
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        guard triangle[0].count > 0 else {
            return 0
        }
        let n = triangle.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
        dp[0][0] = triangle[0][0]
        var ans = n == 1 ? dp[0][0] : Int.max
        for i in 1..<n {
            for j in 0..<n {
                if j <= i {
                    if j == 0 {
                        dp[i][j] = dp[i-1][j] + triangle[i][j]
                    } else if j == i {
                        dp[i][j] = dp[i-1][j-1] + triangle[i][j]
                    } else {
                        dp[i][j] = min(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
                    }
                    
                    if i == n-1 {
                        ans = min(ans, dp[n-1][j])
                    }
                }
            }
        }
        
        return ans
    }
}

let s = Solution()
let r1 = s.minimumTotal([
     [2]
])
let r2 = s.minimumTotal([
     []
])
let r3 = s.minimumTotal([
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
])

