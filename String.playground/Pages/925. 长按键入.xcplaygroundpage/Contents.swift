
/*
    First
    关键：双指针
    时间复杂度：O(s+t)
    空间复杂度：O(1)
*/

class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        
        let sn = Array(name)
        let st = Array(typed)
        
        if sn.count > st.count {
            return false
        }
        
        if sn.count == 0, st.count == 0 {
            return true
        }
        
        var last:Character? = nil
        
        var i = 0
        var j = 0
        
        while i < sn.count || j < st.count {
            if i < sn.count, j < st.count, sn[i] == st[j] {
                last = sn[i]
                i += 1
                j += 1
                continue
            } else if j < st.count, last == st[j] {
                j += 1
                continue
            } else {
                return false
            }
        }
        return true
    }
}

let s = Solution()
let r = s.isLongPressedName("pyplrz","ppyypllr")
