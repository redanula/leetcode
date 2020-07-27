/*
    First / Best
    关键：遍历
    时间复杂度：O(s+t)
    空间复杂度：O(1)
*/
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        
        let sa = Array(s)
        let ta = Array(t)
        
        var si = 0
        var ti = 0
        
        while si < sa.count, ti < ta.count {
            
            if (sa[si] == ta[ti]) {
                si += 1
            }
            ti += 1
        }
        
        return si == sa.count
        
    }
}

let s = Solution()
let r = s.isSubsequence("abc", "ahbgdc")
let r2 = s.isSubsequence("axc", "ahbgdc")
let r3 = s.isSubsequence("a", "b")
let r4 = s.isSubsequence("aaa", "bba")
