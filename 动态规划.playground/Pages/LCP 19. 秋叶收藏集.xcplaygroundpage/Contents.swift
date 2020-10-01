/*
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func minimumOperations(_ leaves: String) -> Int {

        let n = leaves.count
        let sa = Array(leaves)
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 3), count: n)
        dp[0][0] = sa[0] == "y" ? 1 : 0
        dp[0][1] = Int.max
        dp[0][2] = Int.max
        dp[1][2] = Int.max
        for i in 1..<n {
            let isRed = (sa[i] == "r")
            let isYellow = (sa[i] == "y")
            dp[i][0] = dp[i - 1][0] + (isYellow ? 1 : 0)
            dp[i][1] = min(dp[i - 1][0], dp[i - 1][1]) + (isRed ? 1 : 0)
            if (i >= 2) {
                dp[i][2] = min(dp[i - 1][1], dp[i - 1][2]) + (isYellow ? 1 : 0)
            }
        }
        return dp[n - 1][2]
    }
}

let s = Solution()
let r = s.minimumOperations("rrryyyrryyyrr")
