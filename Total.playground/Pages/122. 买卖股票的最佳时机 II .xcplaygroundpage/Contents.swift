/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        var dp0 = 0
        var dp1 = -prices[0]
        for i in 1..<prices.count {
            let ndp0 = max(dp0, dp1 + prices[i])
            let ndp1 = max(dp1, dp0 - prices[i])
            dp0 = ndp0
            dp1 = ndp1
        }
        return dp0
    }
}
