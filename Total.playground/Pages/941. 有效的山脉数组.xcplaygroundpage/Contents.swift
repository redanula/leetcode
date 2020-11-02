/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    
    func validMountainArray(_ A: [Int]) -> Bool {
        
        guard A.count > 2 else {
            return false
        }
        
        var i = 0
        while i + 1 < A.count, A[i] < A[i+1] {
            i += 1
        }
        if i==0 || i==A.count-1 {
            return false
        }
        while i + 1 < A.count, A[i] > A[i+1] {
             i += 1
        }
        
        return i==A.count-1
    }
    
}

let s = Solution()
let r = s.validMountainArray([0,3,2,1])
