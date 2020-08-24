/*
    First
    关键：枚举
    时间复杂度：O(n2)
    空间复杂度：O(n)
*/

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        
        guard s.count > 1 else {
            return false
        }
        
        let sa = Array(s)
        let n = sa.count
        for len in (1...n-1).reversed() {
            if n%len != 0 {
                continue
            }

            let count = n/len
            var s1 = ""
            for _ in 1...count {
                s1.append(String(sa[0...len-1]))
            }
            
            if s1 == s {
                return true
            }
        }
        
        return false
    }
}

let s = Solution()
let r = s.repeatedSubstringPattern("abc")
let r2 = s.repeatedSubstringPattern("abcabc")
let r3 = s.repeatedSubstringPattern("a")
let r4 = s.repeatedSubstringPattern("aaaaa")
let r5 = s.repeatedSubstringPattern("abab")
