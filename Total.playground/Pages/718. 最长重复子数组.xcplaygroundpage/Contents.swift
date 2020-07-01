/*
    718. 最长重复子数组
    First / Best
    关键：动态规划
    时间复杂度：O(m*n)
    空间复杂度：O(m*n)
*/


class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        guard A.count > 0, B.count > 0 else {
            return 0
        }
        var ans = 0
        var dp = Array.init(repeating: Array.init(repeating: 0, count: B.count + 1), count: A.count + 1)
        for i in (0..<A.count).reversed() {
            for j in (0..<B.count).reversed() {
                dp[i][j] = A[i] == B[j] ? dp[i + 1][j + 1] + 1 : 0
                ans = max(ans, dp[i][j])
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.findLength([1,2,3,2,1], [3,2,1,4,7])
let r2 = s.findLength([0,0,0,0,1], [1,0,0,0,0])
