/*
    First / Best
    关键：动态规划
    时间复杂度：O(n2)
    空间复杂度：O(n)
*/

class Solution {
    func integerBreak(_ n: Int) -> Int {
        
        if n <= 1 {
            return 0
        }
        
        var dp = Array.init(repeating: 1, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for k in 1...i-1 {
                dp[i] = max(dp[i], dp[i-k] * k, (i-k) * k)
            }
        }
        return dp[n]
    }
}

let s = Solution()
let r = s.integerBreak(10)
//let r2 = s.integerBreak(3)
//let r2 = s.integerBreak(2)
//let r3 = s.integerBreak(1)
