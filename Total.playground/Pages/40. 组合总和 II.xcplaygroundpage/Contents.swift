/*
    First / Best
    关键：先排序，回溯、剪枝
    时间复杂度：O(S)
    空间复杂度：O(target)
*/
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        let n = candidates.count
        var sortedArray = candidates.sorted()
        var ans = [[Int]]()
        
        func dfs(_ tmp: inout [Int], _ sum: Int, _ startIndex: Int) {
            
            if sum > target {
                return
            } else if sum == target {
                ans.append(tmp)
            } else {
                for i in startIndex..<n {
                    if i > startIndex, sortedArray[i] == sortedArray[i-1]  {
                        continue
                    }
                    tmp.append(sortedArray[i])
                    dfs(&tmp, sum + sortedArray[i], i+1)
                    tmp.removeLast()
                }
            }
        }
        
        var tmp = [Int]()
        dfs(&tmp, 0, 0)
        return ans
    }

}

let s = Solution()
//let r = s.combinationSum2([2,3,6,7], 7)
let r2 = s.combinationSum2([10,1,2,7,6,1,5], 8)
