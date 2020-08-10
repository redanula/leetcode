/*
    First / Best
    关键：动态规划
    时间复杂度：O(|s|)
    空间复杂度：O(1)
*/

class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        
        guard s.count > 1 else {
            return 0
        }
        
        var ans = 0
        let sArray = Array(s)
        var last = 0
        var last0Count = 0
        var last1Count = 0
        last = Int(String(sArray[0]))!
        last0Count = last == 0 ? 1 : 0
        last1Count = last == 1 ? 1 : 0
        for i in 1..<sArray.count {
            var flag = 0
            let current = Int(String(sArray[i]))
            if current == 0 {
                if last == 0 {
                    flag = last1Count >= last0Count + 1 ? 1 : 0
                    last0Count += 1
                } else {
                    flag = 1
                    last0Count = 1
                }
            } else {
                if last == 0 {
                    flag = 1
                    last1Count = 1
                } else {
                    flag = last0Count >= last1Count + 1 ? 1 : 0
                    last1Count += 1
                }
            }
            ans = ans + flag
            last = current!
        }
        return ans
    }
}

let s = Solution()
let r = s.countBinarySubstrings("0011")
let r2 = s.countBinarySubstrings("00110011")
let r3 = s.countBinarySubstrings("10")
let r4 = s.countBinarySubstrings("000111000")







