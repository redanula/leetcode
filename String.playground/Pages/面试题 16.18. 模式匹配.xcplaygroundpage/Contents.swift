/*
    面试题 16.18. 模式匹配
    First / Best
    关键：枚举、边界、对称优化
    时间复杂度：O(v2)
    空间复杂度：O(v)
*/

class Solution {
    func patternMatching(_ pattern: String, _ value: String) -> Bool {

        var countA = 0, countB = 0
        var patternArray = Array(pattern)
        
        // 统计a、b个数
        for i in 0..<patternArray.count {
            if patternArray[i] == "a" {
                countA += 1
            } else {
                countB += 1
            }
        }
        
        // 如果 a<b 则交换
        if countA < countB {
            let tmp = countB
            countB = countA
            countA = tmp
             for i in 0..<patternArray.count {
                if patternArray[i] == "a" {
                       patternArray[i] = "b"
                } else {
                       patternArray[i] = "a"
                }
            }
        }
        
        if value.count == 0 {
            return countB == 0
        }
        
        // pattern是0则false
        if pattern.count == 0 {
            return false
        }
    
        // 枚举a的长度
        var lenA = 0
        while lenA * countA <= value.count {
            let rest = value.count - lenA * countA
            // 空字符串、长度可以分配
            if (rest == 0 && countB == 0) || (countB != 0 && rest % countB == 0) {
                let lenB = countB == 0 ? 0 : rest / countB
                var pos = 0, valueA = "", valueB = "", correct = true
                for item in patternArray {
                    if item == "a" {
                        let beginIndex = value.index(value.startIndex, offsetBy: pos)
                        let endIndex = value.index(value.startIndex, offsetBy: pos + lenA)
                        let subStr = String(value[beginIndex..<endIndex])
                        if valueA == "" {
                            valueA = subStr
                        } else {
                            if valueA != subStr {
                                correct = false
                                break
                            }
                        }
                        pos += lenA
                    } else {
                        let beginIndex = value.index(value.startIndex, offsetBy: pos)
                        let endIndex = value.index(value.startIndex, offsetBy: pos + lenB)
                        let subStr = String(value[beginIndex..<endIndex])
                        if valueB == "" {
                            valueB = subStr
                        } else {
                            if valueB != subStr {
                                correct = false
                                break
                            }
                        }
                        pos += lenB
                    }
                }
                if correct && valueA != valueB {
                    return true
                }
            }
            lenA += 1
        }
        return false
    }
}


let s = Solution()

let r = s.patternMatching("abba","dogcatcatdog")
let r2 = s.patternMatching("aaaa","dogcatcatdog")
let r3 = s.patternMatching("","")
