class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        guard nums.count > 0 else {
            return 0
        }
    
        var pre = 0
        var ans = nums[0]
        for i in 0..<nums.count {
            pre = max(pre + nums[i], nums[i])
            ans = max(ans, pre)
        }
        return ans
    }
}

let s = Solution()
let r = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
