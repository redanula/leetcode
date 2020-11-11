/*
    First / Best
    关键：动态规划
    时间复杂度：O(mn^2)
    空间复杂度：O(mn)
*/
class Solution {
    
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        
        let n = ring.count
        let m = key.count
        let sr = Array(ring)
        let sk = Array(key)
        var pos = Array.init(repeating: [Int](), count: 26)
        for i in 0..<n {
            pos[Int(sr[i].asciiValue!) - Int(Character("a").asciiValue!)].append(i)
        }
        var dp = Array.init(repeating: Array.init(repeating: Int.max, count: n), count: m)
        for i in pos[Int(sk[0].asciiValue!) - Int(Character("a").asciiValue!)] {
            dp[0][i] = min(i, n - i) + 1
        }
        
        for i in 1..<m {
            for j in pos[Int(sk[i].asciiValue!) - Int(Character("a").asciiValue!)] {
                for k in pos[Int(sk[i-1].asciiValue!) - Int(Character("a").asciiValue!)] {
                    dp[i][j] = min(dp[i][j], dp[i - 1][k] + min(abs(j - k), n - abs(j - k)) + 1)
                }
            }
        }
        
        return dp[m - 1].min()!
    }
    
}

let s = Solution()
let r = s.findRotateSteps("godding", "gd")
