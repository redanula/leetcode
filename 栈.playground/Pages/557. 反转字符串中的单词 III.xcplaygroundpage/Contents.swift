/*
    First / Best
    关键：栈
    时间复杂度：O()
    空间复杂度：O()
*/

class Solution {
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return ""
        }
        let sa = Array(s)
        var ans = [Character]()
        var i = 0
        while i < sa.count {
            
            let start = i
            while i < sa.count && sa[i] != " " {
                i += 1
            }
            
            for j in start..<i {
                ans.append(sa[i-j-1+start])
            }
            
            while i < sa.count && sa[i] == " " {
                ans.append(" ")
                i += 1
            }
        }

        return String(ans)
    }
}

let s = Solution()
let r = s.reverseWords("Let's take LeetCode contest")
