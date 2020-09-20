/*
    First / Best
    回溯
    时间复杂度：O(n×2^n)
    空间复杂度：O(n)
*/

class Solution {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let len = nums.count
        
        func dfs(_ start: Int, _ col: inout [Int]) {
            
            ans.append(col)
            
            if col.count == len {
                return
            }

            for i in start..<len {
                col.append(nums[i])
                dfs(i+1, &col)
                col.popLast()
            }
        }
        
        var col = [Int]()
        dfs(0, &col)
        
        return ans
    }
}

let s = Solution()
let r = s.subsets([1,2,3])
