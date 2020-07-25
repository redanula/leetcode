/*
    First / Best
    关键: 动态规划
    时间复杂度：O(n2m)
    空间复杂度：O(nm)
*/

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        
        guard nums.count >= m else {
            return 0
        }
        
        var sum = Array.init(repeating: 0, count: nums.count + 1)
        var dp = Array.init(repeating: Array.init(repeating: Int.max, count: m + 1), count: nums.count + 1)
        for i in 0..<nums.count {
            sum[i + 1] = sum[i] + nums[i]
        }
        
        dp[0][0] = 0
        for i in 1...nums.count {
            for j in 1...min(i,m) {
                for k in 0..<i {
                    dp[i][j] = min(dp[i][j], max(dp[k][j-1], sum[i] - sum[k]))
                }
            }
        }
        
        return dp[nums.count][m]
    }
}

let s = Solution()
let r = s.splitArray([7,2,5,10,8], 2)

//7; 2 5 10 8 = 7; 25 = 25
//72; 5 10 8 = 7+2; 23 = 23
//725; 10 8 = 14 18 = 18
//72510; 8 =
