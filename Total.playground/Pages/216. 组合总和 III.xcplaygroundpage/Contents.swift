/*
    First / Best
    关键：回溯、剪枝
    时间复杂度：O(S)
    空间复杂度：O(target)
*/
class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        
        var ans = [[Int]]()
        
        func dfs(_ tmp: inout [Int], _ sum: Int, _ start: Int) {
            
            if sum > n || tmp.count > k || start > 10 {
                return
            } else if sum == n, tmp.count == k {
                ans.append(tmp)
            } else {
                for i in start..<10 {
                    tmp.append(i)
                    dfs(&tmp, sum + i, i+1)
                    tmp.removeLast()
                }
            }
        }
        
        var tmp = [Int]()
        dfs(&tmp, 0, 1)
        return ans
    }

}

let s = Solution()
let r = s.combinationSum3(3,9)
