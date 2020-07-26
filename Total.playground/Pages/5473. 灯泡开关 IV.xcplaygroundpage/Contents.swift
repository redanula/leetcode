/*
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(n)
*/
class Solution {
    func minFlips(_ target: String) -> Int {
        let targetA = Array(target)
        var dp = Array.init(repeating: Int.max, count: targetA.count + 1)
        dp[0] = targetA[0] == "0" ? 0 : 1
        for i in 1..<targetA.count {
            if targetA[i] == "0", dp[i-1] % 2 == 0 {
                dp[i] = dp[i-1]
            } else if targetA[i] == "1", dp[i-1] % 2 != 0 {
                dp[i] = dp[i-1]
            } else {
                dp[i] = dp[i-1] + 1
            }
        }
        return dp[targetA.count - 1]
    }
}

let s = Solution()
let r = s.minFlips("10111")
let r2 = s.minFlips("101")
let r3 = s.minFlips("00000")
let r4 = s.minFlips("001011101")
