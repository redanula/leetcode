/*
    First / Best
    关键：栈
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    
    func isValid(_ s: String) -> Bool {
        guard s.count > 0 else {
            return true
        }
        
        let sa = Array<Character>.init(s)
        var stack = [Character]()
        
        var i = 0
        while i < sa.count {
            if sa[i] == "(" || sa[i] == "[" || sa[i] == "{" {
                stack.append(sa[i])
            } else {
                guard stack.count > 0 else {
                    return false
                }
                
                let last = stack.popLast()
                if sa[i] == ")", last != "(" {
                    return false
                } else if sa[i] == "]", last != "[" {
                    return false
                } else if sa[i] == "}", last != "{" {
                    return false
                }
            }
            
            i += 1
        }
        
        if stack.count > 0 {
            return false
        }
        
        return true
    }
}

let s = Solution()
let r = s.isValid("()")
let r2 = s.isValid("([{}])")
let r3 = s.isValid("([)]")
let r4 = s.isValid("")
