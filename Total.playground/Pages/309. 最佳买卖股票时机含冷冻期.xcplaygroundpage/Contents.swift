/*
    309. 最佳买卖股票时机含冷冻期
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var f0 = -prices[0]
        var f1 = 0
        var f2 = 0
        for i in 1..<prices.count {
            let nf0 = max(f0, f2 - prices[i])
            let nf1 = f0 + prices[i]
            let nf2 = max(f1, f2)
            f0 = nf0
            f1 = nf1
            f2 = nf2
        }
        return max(f1, f2)
    }
    
    func maxProfit_first(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var dp = Array.init(repeating:Array.init(repeating: 0, count: 3), count:prices.count + 1)
        dp[0][0] = -prices[0]
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i-1][0], dp[i-1][2] - prices[i])
            dp[i][1] = dp[i-1][0] + prices[i]
            dp[i][2] = max(dp[i-1][1], dp[i-1][2])
        }
        return max(dp[prices.count - 1][1],dp[prices.count - 1][2])
    }
}

let s = Solution()
let r = s.maxProfit([1,2,3,0,2])


