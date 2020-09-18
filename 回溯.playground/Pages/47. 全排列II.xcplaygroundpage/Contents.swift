/*
    First / Best
    回溯
    时间复杂度：O()
    空间复杂度：O()
*/
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let len = nums.count
        let snums = nums.sorted()
        
        func dfs(_ tmp: inout [Int], _ cur: Int, _ pick: inout [Int: Int]) {
            
            if cur == len {
                ans.append(tmp)
                return
            }
            
            for i in 0..<len {
                if pick[i] == 1 || (pick[i-1] == 0 && i > 0 && snums[i] == snums[i-1]) {
                    continue
                }
                tmp.append(snums[i])
                pick[i] = 1
                dfs(&tmp, cur + 1, &pick)
                tmp.popLast()
                pick[i] = 0
            }
        }
        
        var tmp = [Int]()
        var pick = [Int: Int]()
        dfs(&tmp, 0, &pick)
        
        return ans
    }
}

let s = Solution()
let r = s.permuteUnique([1,1,2])
