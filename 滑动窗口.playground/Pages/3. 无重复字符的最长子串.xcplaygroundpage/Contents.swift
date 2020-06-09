/*
    3. 无重复字符的最长子串
    First / Best
    关键：滑动窗口
    时间复杂度：O(n)
    空间复杂度：O(m), m为字符可出现个数
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var start = 0, end = 0, result = 0
    let charsArray = Array(s)
    let length = charsArray.count
    var hashValue:[Character: Int] = [:]
    
    while start < length && end < length {
        
        let currentChat = charsArray[end]
        
        if let cacheIndex = hashValue[currentChat] {
            start = max(start, cacheIndex)
        }
        end = end + 1
        result = max(result, end - start)
        hashValue[currentChat] = end
    }
    return result
}


let a = lengthOfLongestSubstring("abac")

