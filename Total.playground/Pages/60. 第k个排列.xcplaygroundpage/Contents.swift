/*
    First / Best
    关键：
    时间复杂度：O(n2)
    空间复杂度：O(n)
*/
class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
    
        var map = Array.init(repeating: 1, count: n + 1)
        var f = Array.init(repeating: 1, count: n)
        for i in 1..<n {
            f[i] = f[i-1] * i
        }
        
        var vk = k - 1
        var ans = ""
        for i in 1...n {
            var order = vk / f[n-i] + 1
            for j in 1...n {
                order -= map[j]
                if order == 0 {
                    ans += String(j)
                    map[j] = 0
                    break
                }
            }
            vk %= f[n - i]
        }
        return ans
    }
}

let s = Solution()
let r = s.getPermutation(4, 9)
let r2 = s.getPermutation(1, 1)
