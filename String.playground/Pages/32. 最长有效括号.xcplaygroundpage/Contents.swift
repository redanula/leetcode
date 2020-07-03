/*
    32. 最长有效括号
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(n)
*/


class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var ans = 0
        let sArray = Array(s)
        guard sArray.count > 0 else {
            return 0
        }
        var dp = Array.init(repeating: 0, count: sArray.count)
        for i in 1..<sArray.count {
            if sArray[i] == ")" {
                if sArray[i - 1] == "(" {
                    if i == 1 {
                        dp[1] = 2
                    } else {
                        dp[i] = dp[i - 2] + 2
                    }
                } else if i - dp[i - 1] > 0, sArray[i - dp[i - 1] - 1] == "(" {
                     if i - dp[i - 1] == 1 {
                         dp[i] = dp[i - 1] + 2
                     } else {
                         dp[i] = dp[i - 1] + dp[i - dp[i - 1] - 2] + 2
                     }
                }
            }
            ans = max(ans, dp[i])
        }
        return ans
    }
}


let s = Solution()
let r = s.longestValidParentheses("()")
let r1 = s.longestValidParentheses(")()())")
let r2 = s.longestValidParentheses("()(())")
let r3 = s.longestValidParentheses("(()())")

