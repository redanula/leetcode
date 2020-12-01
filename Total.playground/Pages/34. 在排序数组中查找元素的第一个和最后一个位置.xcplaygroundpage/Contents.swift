/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var ans = [-1, -1]
        guard nums.count > 0 else {
            return ans
        }
        
        for i in 0..<nums.count {
            let n = nums[i]
            if n > target {
                break
            } else if n < target {
                continue
            } else {
                if ans[0] == -1 {
                    ans[0] = i
                    ans[1] = i
                } else {
                    ans[1] = i
                }
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.searchRange([5,7,7,8,8,10], 8)
