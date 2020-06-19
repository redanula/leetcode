/*
    125. 验证回文串
    First / Best
    关键：双指针
    时间复杂度：O(s)
    空间复杂度：O(1)
*/

func isPalindrome(_ s: String) -> Bool {

    let chars = Array(s)
    
    guard chars.count > 0 else {
        return true
    }
    
    var i = 0
    var j = chars.count - 1
    while i < j {
        
        // 有一方不是数字字母
        if !chars[i].isLetter && !chars[i].isNumber {
            i += 1
            continue
        } else if !chars[j].isLetter && !chars[j].isNumber {
            j -= 1
            continue
        }
        
        if chars[i].isNumber && chars[j].isNumber {
            if chars[i] != chars[j] {
                return false
            }
        }else if chars[i].isLetter && chars[j].isLetter {
            if chars[i].uppercased() != chars[j].uppercased() {
                return false
            }
        }else {
            return false
        }
        
        i += 1
        j -= 1
    }
    
    return true
}

let r = isPalindrome("A man, a plan, a canal: Panama")
let r2 = isPalindrome("race a car")
let r3 = isPalindrome("r")
let r4 = isPalindrome("")
let r5 = isPalindrome(" , , ,")
let r6 = isPalindrome("A b    c  B a")
let r7 = isPalindrome("0P")
