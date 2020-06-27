/*
    41. 缺失的第一个正数
    First / Best
    关键：规律 如果1...N都出现，则是N+1，否则在1...N中间
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        
        var vnums = nums
        var n = vnums.count
         for i in 0..<n {
            if vnums[i] <= 0 {
                vnums[i] = n + 1
            }
        }
       
        for i in 0..<n {
            var a = abs(vnums[i])
            if a <= n {
                vnums[a-1] = -abs(vnums[a-1])
            }
        }
        
        for i in 0..<n {
            if vnums[i] > 0 {
                return i + 1
            }
        }
        
        return n+1
    }
}


let s = Solution()
let r = s.firstMissingPositive([1,2,0])
let r2 = s.firstMissingPositive([3,4,-1,1])
let r3 = s.firstMissingPositive([7,8,9,11,12])
