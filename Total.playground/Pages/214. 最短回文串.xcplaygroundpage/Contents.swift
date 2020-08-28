/*
    First / Best
    关键：KMP
    时间复杂度：O(|s|)
    空间复杂度：O(|s|)
*/

class Solution {
    func shortestPalindrome(_ s: String) -> String {
        
        guard s.count > 0 else {
            return ""
        }
        
        let n = s.count
        let sa:[Character] = Array(s)
        var fail = Array.init(repeating: -1, count: n)
        for i in 1..<n {
            var j = fail[i - 1];
            while j != -1 && sa[j + 1] != sa[i] {
                j = fail[j]
            }
            if sa[j + 1] == sa[i] {
                fail[i] = j + 1
            }
        }
        var best = -1
        for i in (0..<n).reversed() {
            while best != -1 && sa[best + 1] != sa[i] {
                best = fail[best]
            }
            if sa[best + 1] == sa[i] {
                best += 1
            }
        }
        let add = best == n - 1 ? "" : (String(sa[best + 1..<n].reversed()))
        return add + s;
    }
}





let s = Solution()
let r = s.shortestPalindrome("abc")
let r2 = s.shortestPalindrome("a")
let r3 = s.shortestPalindrome("")
//let r2 = s.shortestPalindrome("abccba")
