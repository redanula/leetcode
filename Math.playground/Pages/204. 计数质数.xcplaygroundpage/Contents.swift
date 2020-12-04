/*
    First / Best
    关键：
    时间复杂度：O(n √n)
    空间复杂度：O(1)
*/

class Solution {
    func countPrimes(_ n: Int) -> Int {
        
        guard n > 2 else {
            return 0
        }

        if n == 3 {
            return 1
        }

        var ans = 2
        for i in 4..<n {

            var isP = true
            var j = 2
            while j * j <= i {
                if i % j == 0 {
                   isP = false
                   break
                }
                j += 1
            }
            if isP {
                // print(i)
                ans += 1
            }
        }

        return ans

    }
}
