/*
    First / Best
    时间复杂度：O(3^m + 4^n)
    空间复杂度：O(m+n)
*/

class Solution {
    
    var ans = [String]()
    var map = ["2":"abc","3":"def","4":"ghi",
               "5":"jkl","6":"mno","7":"pqrs",
               "8":"tuv","9":"wxyz"]
    
    func dfs(_ current: String, _ digits: String, _ charIndex: Int) {
        
        if current.count == digits.count {
            ans.append(current)
        } else {
            // 长度不够，继续增加
            let charKey = String(Array(digits)[charIndex])
            if let ca = map[charKey] {
                for c in ca {
                    let ns = current + String(c)
                    dfs(ns, digits, charIndex + 1)
                }
            }
        }
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        
        guard digits.count > 0 else {
            return []
        }
        
        dfs("", digits, 0)
        return ans
    }
}

let s = Solution()
let r = s.letterCombinations("23")
