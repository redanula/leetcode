/*
    139. 单词拆分
    First
    关键：枚举 Best可以动态规划
    时间复杂度：O(n2)
    空间复杂度：O(n)
*/

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var map = [String: Int]()
        for i in 0..<wordDict.count {
            map[wordDict[i]] = 1
        }
        let sArray = Array(s)
        guard sArray.count > 0 else {
            return false
        }
        return word(sArray, &map, 0)
    }
    
    func word(_ sArray: [Character], _ wordMap: inout [String: Int], _ start: Int) -> Bool {
        if start == sArray.count {
            return true
        }
        
        if let mapping = wordMap[String(sArray[start...sArray.count-1])] {
            if mapping == 2 {
                return false
            }
        }
        
        for i in start..<sArray.count {
            
            if wordMap[String(sArray[start...i])] == 1 {
                if word(sArray, &wordMap, i + 1) {
                    return true
                }
            }
        }
        wordMap[String(sArray[start...sArray.count-1])] = 2
        return false
    }
}

let s = Solution()
let r = s.wordBreak("leetcode", ["leet", "code"])
let r2 = s.wordBreak("applepenapple", ["apple", "pen"])
let r3 = s.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])

let r4 = s.wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
let r5 = s.wordBreak("aaaaaaa",["aaaa","aaa"])

