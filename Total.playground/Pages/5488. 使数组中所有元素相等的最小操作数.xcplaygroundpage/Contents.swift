/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func minOperations(_ n: Int) -> Int {
        var ans = 0
        var i = 0
        while 2 * i + 1 < n {
            ans += n - (2 * i + 1)
            i += 1
        }
        
        return ans
    }
}

let s = Solution()
let r = s.minOperations(3)
let r2 = s.minOperations(6) // [1,3,5,7,9,11]
let r3 = s.minOperations(5) //[1,3,5,7,9]
