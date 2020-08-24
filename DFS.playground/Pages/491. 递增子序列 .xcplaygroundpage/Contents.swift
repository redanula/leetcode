/*
    Best
    时间复杂度：O(2n * n)
    空间复杂度：O(n)
*/

class Solution {
    
    var temp = [Int]()
    var ans = [[Int]]()
    
    func dfs(_ cur: Int, _ last: Int, _ nums: [Int]) {
        if cur == nums.count {
            if temp.count >= 2 {
                ans.append(temp)
            }
            return
        }
        
        if nums[cur] >= last {
            temp.append(nums[cur])
            dfs(cur + 1, nums[cur], nums)
            temp.removeLast()
        }
        
        if nums[cur] != last {
            dfs(cur + 1, last, nums)
        }
    }
    
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        dfs(0, Int.min, nums)
        return ans
    }
}


let s = Solution()
let r = s.findSubsequences([4, 6, 7, 7])
