/*
    10. 正则表达式匹配
    First / Best
    关键：动态规划
    时间复杂度：O(sp)
    空间复杂度：O(sp)
*/

func isMatch(_ s: String, _ p: String) -> Bool {
    
    let sa = Array(s)
    let pa = Array(p)
    var dp = Array.init(repeating: Array.init(repeating: false, count: pa.count+1), count: sa.count+1)
    dp[0][0] = true
    
    func match(_ i: Int, _ j: Int) -> Bool {
        if i == 0 {
            return false
        }
        if pa[j - 1] == "." {
            return true
        } else {
            return sa[i - 1] == pa[j - 1]
        }
    }
    
    for i in 0..<sa.count + 1 {
        for j in 1..<pa.count + 1 {
            
            if pa[j-1] == "*" {
                dp[i][j] = dp[i][j] || dp[i][j - 2];
                if (match(i, j - 1)) {
                    dp[i][j] = dp[i][j] || dp[i - 1][j];
                }
            } else {
                if (match(i, j)) {
                    dp[i][j] = dp[i][j] || dp[i - 1][j - 1];
                }
            }
        }
    }
    
    return dp[sa.count][pa.count]
}



let r = isMatch("aa", "a") //f
let r2 = isMatch("aa", "a*") //t
let r3 = isMatch("ab", ".*") //t
let r4 = isMatch("aab", "c*a*b") //t
let r5 = isMatch("mississippi", "mis*is*p*.") //f
let r6 = isMatch("ab", ".*c") //f


