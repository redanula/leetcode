/*
    关键：双指针
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        var p0 = 0
        var p1 = 0
        for i in 0..<n {
            if nums[i] == 1 {
                let tmp = nums[i]
                nums[i] = nums[p1]
                nums[p1] = tmp
                p1 += 1
            } else if nums[i] == 0 {
                let tmp = nums[i]
                nums[i] = nums[p0]
                nums[p0] = tmp
                if p0 < p1 {
                    let tmp = nums[i]
                    nums[i] = nums[p1]
                    nums[p1] = tmp
                }
                p0 += 1
                p1 += 1
            }
        }
    }
}



let s = Solution()
var a = [2,0,2,1,1,0]
s.sortColors(&a)
