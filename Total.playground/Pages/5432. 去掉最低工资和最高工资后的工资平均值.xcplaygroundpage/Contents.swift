/*
    First
    关键：
    时间复杂度：
    空间复杂度：
*/

class Solution {
    func average(_ salary: [Int]) -> Double {
        var maxV = Int.min
        var minV = Int.max
        var sum = 0
        guard salary.count > 0 else {
            return 0
        }
        
        for i in 0..<salary.count {
            maxV = max(maxV, salary[i])
            minV = min(minV, salary[i])
            sum += salary[i]
        }
        
        guard salary.count > 2 else {
            return 0
        }
        
        return Double((sum - maxV - minV)) / Double((salary.count - 2))
    }
}

let s = Solution()
let r = s.average([4000,3000,1000,2000])
let r2 = s.average([1000,2000,3000])
let r3 = s.average([6000,5000,4000,3000,2000,1000])
let r4 = s.average([1000])
let r5 = s.average([1000,2000])
let r6 = s.average([1000,2000,3000])
