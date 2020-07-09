/*
    面试题 17.13. 恢复空格
    First / Best
    关键：动态规划
    时间复杂度：O(d+n2)
    空间复杂度：O(d*26+n)
*/

class Solution {
    
    func respace(_ dictionary: [String], _ sentence: String) -> Int {
        
        let array = Array(sentence)
        guard array.count > 0 else {
            return 0
        }
        var dp = Array.init(repeating: array.count, count: array.count + 1)
        dp[0] = 0
        let root = Trie()
        for word in dictionary {
            root.insert(word)
        }
        
        for i in 1...array.count {
            dp[i] = dp[i - 1] + 1
            var curPos = root
            
            var j = i
            while j >= 1 {
                let t = Int(array[j-1].asciiValue! - Character("a").asciiValue!)
                if curPos.next[t] == nil {
                    break
                } else if curPos.next[t]!.isEnd {
                    dp[i] = min(dp[i], dp[j-1])
                }
                
                if dp[i] == 0 {
                    break
                }
                curPos = curPos.next[t]!
                j -= 1
            }
        }
        return dp[array.count]
    }
}

class Trie {
    var next:[Trie?] = []
    var isEnd = false
    
    init() {
        next = Array<Trie?>(repeating: nil, count: 26)
        isEnd = false
    }
    
    func insert(_ s: String) {
        var curPos = self
        let reversed = String(s.reversed())
        for char in reversed {
            let t = Int(char.asciiValue! - Character("a").asciiValue!)
            if curPos.next[t] == nil {
                curPos.next[t] = Trie()
            }
            curPos = curPos.next[t]!
        }
        curPos.isEnd = true
    }
}

let s = Solution()
let r2 = s.respace(["looked","just","like","her","brother"], "jesslookedjustliketimherbrother")
let r3 = s.respace([], "")
//let r3 = s.respace()
