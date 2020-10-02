/*
    关键：Hash
    时间复杂度：O(n+m)
    空间复杂度：O(m)

*/

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var mapJ = [Character: Bool]()
        let sj = Array.init(J)
        let ss = Array.init(S)
        var ans = 0
        for i in sj {
            mapJ[i] = true
        }
        for i in ss {
            if let _ = mapJ[i] {
                ans += 1
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.numJewelsInStones("aA", "aAAbbbb")
