/*
    1371. 每个元音包含偶数次的最长子字符串
    Best
    关键：前缀和、状态压缩
    时间复杂度：O(n)
    空间复杂度：O(32)
*/

func findTheLongestSubstring(_ s: String) -> Int {
    
    let chars = Array(s)
    var status:Int8 = 0
    var maps = [Int8:Int]()
    
    guard chars.count > 0 else {
        return 0
    }
    
    var result = 0
    maps[0] = 0
    for i in 0...chars.count - 1 {
        switch chars[i] {
            case "a":
                status ^= (1 << 0)
                break
            case "e":
                status ^= (1 << 1)
                break
            case "i":
                status ^= (1 << 2)
                break
            case "o":
                status ^= (1 << 3)
                break
            case "u":
                status ^= (1 << 4)
                break
            default:
                break
        }
        if let first = maps[status] {
            result = max(result, i + 1 - first)
        } else {
            maps[status] = i + 1
        }
    }
    
    return result
}


let r1 = findTheLongestSubstring("eleetminicoworoep")
let r2 = findTheLongestSubstring("leetcodeisgreat")
let r3 = findTheLongestSubstring("bcbcbc")
