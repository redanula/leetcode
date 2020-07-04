/*
    44. 通配符匹配
    First / Best
    关键：动态规划
    时间复杂度：O(mn)
    空间复杂度：O(mn)
*/
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sa = Array(s)
        let pa = Array(p)
        
        if sa.count == 0, pa.count == 0 {
            return true
        }
        
        if sa.count > 0, pa.count == 0 {
            return false
        }
            
        var dp = Array.init(repeating: Array.init(repeating: false, count: pa.count+1), count: sa.count+1)

        dp[0][0] = true
        for i in 1...pa.count {
            if pa[i - 1] == "*" {
                dp[0][i] = true
            } else {
                break
            }
        }
        
        for i in 1..<sa.count+1 {
            for j in 1..<pa.count+1 {
                
                if pa[j - 1] == "*" {
                    dp[i][j] = dp[i][j - 1] || dp[i - 1][j];
                } else if pa[j - 1] == "?" || pa[j - 1] == sa[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1];
                }
            }
        }
        return dp[sa.count][pa.count]
    }
}

let s = Solution()
let r = s.isMatch("adceb", "*a*b")
//let r = s.isMatch("adceb", "*a*b")
