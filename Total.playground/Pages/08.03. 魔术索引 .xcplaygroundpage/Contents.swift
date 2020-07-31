/*
    First / Best
    关键：二分剪枝
    时间复杂度：O(logn)
    空间复杂度：O(1)
*/
class Solution {
    func findMagicIndex(_ nums: [Int]) -> Int {
        var i = 0
        while i < nums.count {
            if nums[i] == i {
                return i
            } else if nums[i] > i{
                i = nums[i]
            } else {
                i += 1
            }
        }
    
        return -1
    }
}

let s = Solution()
let r = s.findMagicIndex([0,1,2])
