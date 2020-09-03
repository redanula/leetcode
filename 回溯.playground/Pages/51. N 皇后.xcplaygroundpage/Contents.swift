/*
    First / Best
    时间复杂度：O(n!)
    空间复杂度：O(n)
*/

class Solution {
    
    
    func solveNQueens(_ n: Int) -> [[String]] {
        
        var ans = [[String]]()
        var col = Set<Int>()
        var ldr = Set<Int>()
        var rdl = Set<Int>()
        var queens = Array.init(repeating: -1, count: n)
        
        func dfs(_ row: Int) {
            if row == n {
                let t = getAns(queens, n)
                ans.append(t)
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
                    
                    queens[row] = i
                    col.insert(i)
                    ldr.insert(d1)
                    rdl.insert(d2)
                    dfs(row+1)
                    queens[row] = -1
                    col.remove(i)
                    ldr.remove(d1)
                    rdl.remove(d2)
                }
            }
            
        }
        
        dfs(0)
        return ans
    }
    
    func getAns(_ queens:[Int], _ n: Int) -> [String] {
        var res = [String]()
        for i in 0..<n {
            let col = queens[i]
            var str = String()
            for _ in 0..<col {
                str.append(".")
            }
            str.append("Q")
            for _ in col+1..<n {
                str.append(".")
            }
            res.append(str)
        }
        return res
    }
}

let s = Solution()
let r = s.solveNQueens(4)
