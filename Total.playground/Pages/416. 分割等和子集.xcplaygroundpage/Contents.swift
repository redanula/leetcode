/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        
        var sum = 0
        for i in nums {
            sum += i
        }
        
        if sum%2 == 1 {
            return false
        }
        
        sum = sum/2
        
        var dp = [Bool](repeating: false, count: sum + 1)
        dp[0] = true
        
        for i in 0..<nums.count {
            for j in (0..<dp.count).reversed() {
                if j - nums[i] >= 0 {
                    dp[j] = dp[j] || dp[j - nums[i]]
                }
            }
        }
        return dp[sum]
    }
}

let s = Solution()
let r = s.canPartition([1,5,11,5])
let r2 = s.canPartition([1,2,3,5])
