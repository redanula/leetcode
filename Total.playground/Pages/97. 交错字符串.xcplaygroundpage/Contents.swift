
/*
    First / Best
    关键：动态规划
    时间复杂度：O(nm)
    空间复杂度：O(m)
*/

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        let s3Array = Array(s3)
        
        if s1Array.count + s2Array.count != s3Array.count {
            return false
        }
        
        var dp = Array.init(repeating: Array.init(repeating: false, count: s3Array.count + 1), count: s3Array.count + 1)
        
        dp[0][0] = true
        for i in 0...s1Array.count {
            for j in 0...s2Array.count {
                let p = i + j - 1
                if i > 0 {
                    dp[i][j] = dp[i][j] || (dp[i-1][j] && s1Array[i-1] == s3Array[p])
                }
                if j > 0 {
                    dp[i][j] = dp[i][j] || (dp[i][j-1] && s2Array[j-1] == s3Array[p])
                }
            }
        }
        
        return dp[s1Array.count][s2Array.count]
    }
}

let s = Solution()
let r = s.isInterleave("aabcc", "dbbca", "aadbbcbcac")
let r2 = s.isInterleave("aabcc", "dbbca", "aadbbbaccc")
