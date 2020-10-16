/*
    First / Best
    时间复杂度：O(n!)
    空间复杂度：O(n)
*/
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        
        var ans = 0
        var col = Set<Int>()
        var ldr = Set<Int>()
        var rdl = Set<Int>()
        
        func dfs(_ row: Int) {
            if row == n {
                ans += 1
            } else {
                for i in 0..<n {
                    if col.contains(i) {
                        continue
                    }
                    
                    let d1 = row - i
                    if ldr.contains(d1) {
                        continue
                    }
                    
                    let d2 = row + i
                    if rdl.contains(d2) {
                        continue
                    }
                    
                    col.insert(i)
                    ldr.insert(d1)
                    rdl.insert(d2)
                    dfs(row+1)
                    col.remove(i)
                    ldr.remove(d1)
                    rdl.remove(d2)
                }
            }
            
        }
        
        dfs(0)
        return ans
    }
}


let s = Solution()
let r = s.totalNQueens(4)
