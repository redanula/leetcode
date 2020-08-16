/*
    First / Best
    关键：
    时间复杂度：O(logn)
    空间复杂度：O(logn)
*/

class Solution {
    
    var dp = [Int: Int]()
    
    func dfs(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if let ans = dp[n] {
            return ans
        }
        dp[n] = min(1 + n % 2 + dfs(n/2), 1 + n % 3 + dfs(n/3), n)
        return dp[n]!
    }
    
    func minDays(_ n: Int) -> Int {
        
        return dfs(n)
    }
}

let s = Solution()
let r = s.minDays(1)
let r2 = s.minDays(2)
let r3 = s.minDays(3)
let r4 = s.minDays(10)
let r5 = s.minDays(4721031)
