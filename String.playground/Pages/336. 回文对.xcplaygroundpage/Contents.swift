/*

    First / Best
    关键：哈希翻转
    时间复杂度：O(n*m2)
    空间复杂度：O(n*m2)
*/

extension String {
    /// String使用下标截取字符串
    /// string[index]
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
    /// String使用下标截取字符串
    /// string[index..<index]
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}


class Solution {
    
    private var indices:[String:Int] = [:]
    
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var ans = [[Int]]()
        let n = words.count
        let wordsRev = words.map{
            String($0.reversed())
        }
        for i in 0..<n {
            indices[wordsRev[i]] = i
        }

        for i in 0..<n {
            let m = words[i].count
            let singleWord:String = words[i]
            guard m > 0 else {
                continue
            }
            
            for j in 0...m {
                if isPalindrome(singleWord, j, m - 1) {
                    if let left_id = indices[singleWord[0..<j]] {
                        if left_id != i {
                            ans.append([i, left_id])
                        }
                    }
                }
                if j != 0,isPalindrome(singleWord, 0, j - 1) {
                    if let right_id = indices[singleWord[j..<m]] {
                        if right_id != i {
                            ans.append([right_id, i])
                        }
                    }
                }
            }
        }
    
        return ans
    }

    func isPalindrome(_ str: String, _ left: Int, _ right: Int) -> Bool {
        let s = Array(str)
        let len = right - left + 1
        for i in 0..<len/2 {
            if s[left + i] != s[right - i] {
                return false
            }
        }
        return true;
    }
}

/*
输入：["abcd","dcba","lls","s","sssll"]
输出：[[0,1],[1,0],[3,2],[2,4]]
解释：可拼接成的回文串为 ["dcbaabcd","abcddcba","slls","llssssll"]
*/

let s = Solution()
let r = s.palindromePairs(["abcd","dcba","lls","s","sssll"])
let r2 = s.palindromePairs(["a",""])
