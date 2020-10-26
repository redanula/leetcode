/*
    关键：
    时间复杂度：O(n^2)
    空间复杂度：O(n)
*/

class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        
        var ans = [Int]()
        let n = nums.count
        for i in 0..<n {
            var c = 0
            for j in 0..<n {
                if nums[i] > nums[j] {
                    c += 1
                }
            }
            ans.append(c)
        }
        return ans
    }
}

let s = Solution()
let r = s.smallerNumbersThanCurrent([8,1,2,2,3])
