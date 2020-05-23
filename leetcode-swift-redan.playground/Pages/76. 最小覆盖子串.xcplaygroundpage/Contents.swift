/*
    76. 最小覆盖子串
    First / Best
    关键：滑动窗口
    时间复杂度：O(s+t)
    空间复杂度：O(s+t)
*/

func minWindow(_ s: String, _ t: String) -> String {
    let sArray = Array(s)
    let tArray = Array(t)
    guard sArray.count >= tArray.count else {
        return ""
    }
    
    var need = [Character:Int]()
    var window = [Character:Int]()
    // Hash Count
    for char in tArray {
        need[char] = need[char] == nil ? 1 : need[char]! + 1
    }
    
    var left = 0
    var right = 0
    var match = 0
    var len = Int.max
    var start = 0
    while right < sArray.count {
        
        let chara = sArray[right]
        // Match Count
        window[chara] = window[chara] == nil ? 1 : window[chara]! + 1
        if window[chara] == need[chara] {
            match += 1
        }
        
        while match == need.count {
            
            // Mark Min
            if right - left + 1 < len {
                len = right - left + 1
                start = left
            }
            
            let chard = sArray[left]
            if window[chard] != nil {
                window[chard] = window[chard]! - 1
                if let needC = need[chard], window[chard]! < needC {
                    match -= 1
                }
            }
           
            left += 1
        }
        
        right += 1
    }
    
    return len == Int.max ? "" : String(sArray[start...start + len - 1])
}


let r = minWindow("abcabc","aa")

