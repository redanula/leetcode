/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
        
        let n = nums.count
        var ans = 0
        var dp = Array.init(repeating: 0, count: n)
        for i in 0..<n {
            for j in i..<n {
                if i == j {
                    dp[i] = nums[i]
                } else {
                    dp[i] = dp[i] + nums[j]
                }
                if dp[i] >= lower, dp[i] <= upper {
                    ans += 1
                }
            }
        }
        
        return ans
    }
}

var s = Solution()
let r = s.countRangeSum([-2,5,-1], -2, 2)
