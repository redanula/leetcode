/*
    First / Best
    关键：动态规划
    时间复杂度：O(t*n)
    空间复杂度：O(t)
*/

class Solution {
    func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
        var dp = Array.init(repeating: Int.max - 1, count: T + 1)
        dp[0] = 0
        for i in 1...T {
            for c in clips {
                if (c[0] < i && i <= c[1]) {
                    dp[i] = min(dp[i], dp[c[0]] + 1)
                }
            }
        }
        return dp[T] == Int.max - 1 ? -1 : dp[T]
    }
}
