/*
    First / Best
    关键：动态规划
    时间复杂度：O(n2)
    空间复杂度：O(n2)
*/


class Solution {
    
    func countSubstrings(_ s: String) -> Int {
        
        guard s.count > 0 else {
            return 0
        }
        
        let n = s.count
        let sa = Array(s)
        var ans = n
        var dp = Array.init(repeating: Array.init(repeating: false, count: n), count: n)
        
        for i in 0..<n {
            dp[i][i] = true
        }
        
        for i in (0..<n).reversed() {
            for j in i+1..<n {
                if sa[i] == sa[j] {
                    if j - i == 1 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i+1][j-1]
                    }
                    if dp[i][j] {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}

let s = Solution()
let r = s.countSubstrings("aaa")
