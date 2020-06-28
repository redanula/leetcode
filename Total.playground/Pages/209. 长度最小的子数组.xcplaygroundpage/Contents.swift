/*
    First / Best
    关键：双指针
    时间复杂度：O(N)
    空间复杂度：O(1)
*/

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var sum = 0
        var len = Int.max
        while right < nums.count {
            sum += nums[right]
            while sum >= s {
                len = min(right - left + 1, len)
                sum -= nums[left]
                left += 1
            }
            right += 1
        }
        return len == Int.max ? 0 : len
    }
}

let s = Solution()
let r = s.minSubArrayLen(7, [1,2,3,4])
let r1 = s.minSubArrayLen(7, [])
