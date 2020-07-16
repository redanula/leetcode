/*
    First / Best
    关键：二分查找、暴力遍历
    时间复杂度：O(n) Ologn
    空间复杂度：O(1)
*/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        for i in 0..<nums.count {
            if target <= nums[i] {
                return i
            }
        }
        
        return nums.count
    }
}

let s = Solution()
let r = s.searchInsert([1,3,5,6], 5)
let r2 = s.searchInsert([1,3,6,7], 5)
let r3 = s.searchInsert([1,3,5,6], 0)
let r4 = s.searchInsert([1,3,5,6], 2)
let r5 = s.searchInsert([1,3,5,6], 7)
