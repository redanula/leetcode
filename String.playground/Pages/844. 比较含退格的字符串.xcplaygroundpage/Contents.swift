
/*
    First
    关键：枚举
    时间复杂度：O(s+t)
    空间复杂度：O(s+t)
*/
class Solution {
    
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        
        let sa:[Character] = Array(S)
        let ta:[Character] = Array(T)
        
        var saf = [Character]()
        var taf = [Character]()
        for i in 0..<sa.count {
            
            if sa[i] == "#" {
                saf.popLast()
            } else {
                saf.append(sa[i])
            }
        }
        
        for i in 0..<ta.count {
            
            if ta[i] == "#" {
                taf.popLast()
            } else {
                taf.append(ta[i])
            }
        }
        
        if saf.count != taf.count {
            return false
        }
        
        for i in 0..<saf.count {
            if saf[i] == taf[i] {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
}

let s = Solution()
let r = s.backspaceCompare("a#c", "b")
