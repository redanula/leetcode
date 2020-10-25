/*
    关键：
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        
        guard A.count >= 3 else {
            return 0
        }
        
        let n = A.count
        
        var ans = 0
        
        var dpLeft = Array.init(repeating: 0, count: n)
        var dpRight = Array.init(repeating: 0, count: n)
        
        for i in 1..<n {
            dpLeft[i] = A[i-1] < A[i] ? dpLeft[i-1] + 1 : 0
        }
        
        for i in (0..<n-1).reversed() {
            dpRight[i] = A[i+1] < A[i] ? dpRight[i+1] + 1 : 0
        }
        
        for i in 0..<n {
            if dpLeft[i] > 0, dpRight[i] > 0 {
                ans = max(ans, dpLeft[i] + dpRight[i] + 1)
            }
        }
        
        return ans
    }
}


let s = Solution()
let r = s.longestMountain([2,1,4,7,3,2,5])
