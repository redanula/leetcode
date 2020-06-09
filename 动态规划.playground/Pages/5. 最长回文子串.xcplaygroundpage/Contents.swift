/*
    5. 最长回文子串
    Best
    关键：动态规划->中心扩展
    时间复杂度：O(n2)
    空间复杂度：O(n2)->O(1)
*/

func longestPalindrome(_ s: String) -> String {
    let chars = Array(s)
    guard chars.count > 0 else {
        return ""
    }
    
    var start = 0
    var end = 0
    for i in 0..<chars.count {
        let len1 = expendString(chars, start: i, end: i)
        let len2 = expendString(chars, start: i, end: i+1)
        let len = max(len1, len2)
        if (len > end - start) {
            start = i - (len - 1) / 2;
            end = i + len / 2;
        }
    }
    return String(chars[start..<end+1])
}

func expendString(_ ss: [Character], start:Int, end:Int) -> Int {
    var left = start
    var right = end
    while left >= 0 && right < ss.count && ss[left] == ss[right] {
        left = left - 1
        right = right + 1
    }
    return right - left - 1
}

let r = longestPalindrome("babad")
