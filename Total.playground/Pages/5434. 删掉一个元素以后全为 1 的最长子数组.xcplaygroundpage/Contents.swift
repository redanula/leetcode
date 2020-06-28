class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        if nums.count == 1 {
            return 0
        }
       
        return 0
    }
}

let s = Solution()
let r = s.longestSubarray([1,1,0,1])
let r2 = s.longestSubarray([0,1,1,0,1])
let r3 = s.longestSubarray([0,1,1,1,0,1,1,0,1])
//let r3 = s.longestSubarray([1,1,1])
//let r4 = s.longestSubarray([1,1,0,0,1,1,1,0,1])
//let r5 = s.longestSubarray([0,0,0])
