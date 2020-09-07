/*
    First / Best
    关键：回溯
    时间复杂度：O((Cnk) * k)
    空间复杂度：O(n+k)
*/
class Solution {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        
        func dfs(_ start: Int, _ kArray:inout [Int]) {
            
            if start > n {
                return
            }
            
            for i in start...n {
                kArray.append(i)
                // 构成数组，记录
                if kArray.count == k {
                    ans.append(kArray)
                } else {
                    // 还需要补充数组
                    dfs(i + 1, &kArray)
                }
                // 回溯
                kArray.removeLast()
            }
            
        }
        
        var tmp = [Int]()
        dfs(1, &tmp)
        return ans
    }
}

let s = Solution()
let r = s.combine(4, 2)
