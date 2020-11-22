/*
    关键：
    时间复杂度：O(s)
    空间复杂度：O(s)
*/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        guard s.count == t.count else {
            return false
        }
        
        var mapa = [Character: Int]()
        
        for c in s {
            if let _ = mapa[c] {
                mapa[c]! += 1
            } else {
                mapa[c] = 1
            }
        }
        
        for c in t {
            if let _ = mapa[c] {
                mapa[c]! -= 1
                if mapa[c]! <= -1 {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
}

let s = Solution()
let r = s.isAnagram("ab", "a")
