class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        
        var index = 0
        
        for i in 1...n {
            if n % i == 0 {
                index += 1
                if index == k {
                    return i
                }
            }
        }
        
        return -1
    }
}

let s = Solution()
let r = s.kthFactor(12, 3)
let r1 = s.kthFactor(1, 1)
let r2 = s.kthFactor(7, 2)
