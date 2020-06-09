/*
    680. 验证回文字符串 Ⅱ
    First / Best
    关键：贪心、双指针、去除左或右后，子串有两种情况
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

func validPalindrome(_ s: String) -> Bool {
    
    let chars = Array(s)
    
    guard chars.count > 0 else {
        return false
    }
    
    for i in 0...chars.count - 1 {
        let j = chars.count - 1 - i
        if i >= j {
            return true
        }
        if chars[i] == chars[j] {
            continue
        } else {
            var il = true
            var jl = true
            var jj = j-1
            for ii in i...j-1 {
                if chars[ii] != chars[jj] {
                    il = false
                }
                jj = jj - 1
            }
            jj = j
            for ii in i+1...j {
                if chars[ii] != chars[jj] {
                    jl = false
                }
                jj = jj - 1
            }
            
            return il||jl
        }
    }
    
    return false
}


let r = validPalindrome("cuppucu")
