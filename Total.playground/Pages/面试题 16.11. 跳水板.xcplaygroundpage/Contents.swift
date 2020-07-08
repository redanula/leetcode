/*
    First / Best
    关键：
    时间复杂度：O(k)
    空间复杂度：O(1)
*/


class Solution {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        var ans = [Int]()
        var sum = 0
        var last = 0
        for i in 0...k {
            sum = longer * i + shorter * (k - i)
            if sum != last {
                ans.append(sum)
            }
            last = sum
        }
        return ans
    }
}

let s = Solution()
let r = s.divingBoard(1, 2, 3)
let r2 = s.divingBoard(1, 1, 3)
let r3 = s.divingBoard(1, 1, 0)
