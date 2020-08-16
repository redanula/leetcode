/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        guard arr.count > 2 else {
            return false
        }
        
        var count = 0
        for i in 0..<arr.count {
            if arr[i] % 2 == 1 {
                count += 1
                if count >= 3 {
                    return true
                }
            } else {
                count = 0
            }
        }
        
        return false
    }
}

let s = Solution()
let r = s.threeConsecutiveOdds([1,2,34,3,4,5,7,23,12])
