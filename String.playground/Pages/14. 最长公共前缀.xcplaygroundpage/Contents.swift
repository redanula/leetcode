/*
    14. 最长公共前缀
    First / Best
    关键：
    时间复杂度：O(mn), m 是所有字符串中的最小长度，n 是字符串的数量
    空间复杂度：O(1)
*/

func longestCommonPrefix(_ strs: [String]) -> String {
    
    guard strs.count > 0 else {
        return ""
    }
    
    guard strs[0].count > 0 else {
        return ""
    }
    
    var shortIndex = 0
    var len = Int.max
    for i in 0..<strs.count {
        if strs[i].count < len {
            len = strs[i].count
            shortIndex = i
        }
    }
    
    let shortArray = Array(strs[shortIndex])
    var shortArrayCount = shortArray.count
    for i in 0..<strs.count {
        
        if i == shortIndex {
            continue
        }
        
        let sArray = Array(strs[i])
        for j in 0..<shortArrayCount {

            if sArray[j] == shortArray[j] {
                continue
            } else {
                shortArrayCount = j
                break
            }
        }
        
        if shortArrayCount == 0 {
            return ""
        }
    }
    
    return String(shortArray[0..<shortArrayCount])
}

let r = longestCommonPrefix(["flower","flow","flight"])
let r2 = longestCommonPrefix(["dog","racecar","car"])
let r3 = longestCommonPrefix([""])
let r4 = longestCommonPrefix(["dog"])

