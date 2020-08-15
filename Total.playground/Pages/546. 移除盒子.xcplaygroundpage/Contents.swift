/*
    First / Best
    关键：动态规划
    时间复杂度：O(n4)
    空间复杂度：O(n3)
*/

class Solution {
    
    func removeBoxes(_ boxes: [Int]) -> Int {
        let n:Int = boxes.count
        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: n), count: n), count: n)
        for i in 0..<n {
            for k in 0...i {
                dp[i][i][k] = (1 + k) * (1 + k)
            }
        }
        for t in 1..<n {
            for j in t..<n {
                let i = j - t
                for k in 0...i {
                    var res:Int = (1 + k) * (1 + k) + dp[i + 1][j][0]
                    for m in (i + 1)...j {
                        if boxes[m] == boxes[i] {
                            res = max(res, dp[i + 1][m - 1][0] + dp[m][j][k + 1])
                        }
                    }
                    dp[i][j][k] = res
                }
            }
        }
        return n == 0 ? 0 : dp[0][n - 1][0]
    }
}


let s = Solution()
let r = s.removeBoxes([1,3,2,2,2,3,4,3,1])

