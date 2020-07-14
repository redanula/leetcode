/*
    96. 不同的二叉搜索树
    First / Best
    关键：动态规划
    时间复杂度：O(n2)
    空间复杂度：O(n)
*/

class Solution {
    func numTrees(_ n: Int) -> Int {
        
        guard n > 1 else {
            return 1
        }
        
        var dp = Array.init(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        return dp[n]
    }
}

let s = Solution()
let r1 = s.numTrees(1)
let r2 = s.numTrees(2)
let r3 = s.numTrees(3)
let r4 = s.numTrees(4)
