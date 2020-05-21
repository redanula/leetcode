/*
    5. 最长回文子串
    First
    关键：动态规划
    时间复杂度：O(n2)
    空间复杂度：O(n2)
*/

func longestPalindrome(_ s: String) -> String {
    
    var ans = ""
    let chars = Array(s)
    var dp = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
    for l in 0..<chars.count {
        for i in 0..<chars.count - l {
            let j = i + l
            if l == 0 {
                dp[i][j] = true
            }
            else if l == 1 {
                dp[i][j] = chars[i] == chars[j]
            }
            else {
                dp[i][j] = chars[i] == chars[j] && dp[i+1][j-1]
            }

            if dp[i][j] && l + 1 > ans.count {
                ans = String(chars[i...j])
            }
        }
    }
    
    
    return ans
}

let r = longestPalindrome("aa")
