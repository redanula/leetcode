/*
    First / Best
    关键：动态规划
    时间复杂度：O(n^2)
    空间复杂度：O(n)
*/


class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else {
            return true
        }
        let n = nums.count
        var dp = Array.init(repeating: 0, count: n)
        
        for i in (0..<n).reversed() {
            for j in i..<n {
                if i == j {
                    dp[j] = nums[i]
                } else {
                    dp[j] = max(nums[i]-dp[j], nums[j]-dp[j-1])
                }
            }
        }
        
        
        return dp[n-1] >= 0
    }
}

let s = Solution()
let r = s.PredictTheWinner([1, 5, 2])
let r2 = s.PredictTheWinner([1, 5, 233, 7])
let r3 = s.PredictTheWinner([])
let r4 = s.PredictTheWinner([1,2])
let r5 = s.PredictTheWinner([1])
