/*
    First / Best
    关键：动态规划
    时间复杂度：O(n3)
    空间复杂度：O(n2)
*/
class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else { return 0 }
        let n = nums.count
        var dp = Array.init(repeating: Array.init(repeating: 0, count: n+2), count: n+2)
        var val = Array.init(repeating: 0, count: n + 2)
        val[0] = 1
        val[n+1] = 1
        for i in 1...n {
            val[i] = nums[i-1]
        }
        
        for i in (0..<n).reversed() {
            for j in i+2...n+1 {
                for k in i+1..<j {
                    var sum = val[i] * val[j] * val[k]
                    sum += dp[i][k] + dp[k][j]
                    dp[i][j] = max(sum, dp[i][j])
                }
            }
        }
        return dp[0][n+1]
    }
}

let s = Solution()
let r = s.maxCoins([3,1,5,8])
