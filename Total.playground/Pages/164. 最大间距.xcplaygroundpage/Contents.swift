/*
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(1)
*/

class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        var ans = 0
        let sn = nums.sorted()
        for i in 1..<sn.count {
            ans = max(ans, sn[i] - sn[i-1])
        }
        return ans
    }
}

let s = Solution()
let r = s.maximumGap([3,6,9,1])
