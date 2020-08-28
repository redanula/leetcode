/*
    First / Best
    关键：无
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var p = (0, 0)
        for i in moves {
            if i == "U" {
                p.1 += 1
            } else if i == "D" {
                p.1 -= 1
            } else if i == "R" {
                p.0 += 1
            } else if i == "L" {
                p.0 -= 1
            }
        }
        return p == (0, 0)
    }
}

let s = Solution()
let r = s.judgeCircle("UD")
let r2 = s.judgeCircle("LL")
