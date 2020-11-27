/*
    关键：分组
    时间复杂度：O(n^2)
    空间复杂度：O(n^2)
*/

class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        guard A.count > 0, B.count > 0, C.count > 0, D.count > 0 else {
            return 0
        }
        var ans = 0
        var map = [Int: Int]()
        for a in A {
            for b in B {
                if let _ = map[a+b] {
                    map[a+b]! += 1
                } else {
                    map[a+b] = 1
                }
            }
        }
        for c in C {
            for d in D {
                if let _ = map[-c-d] {
                    ans += map[-c-d]!
                }
            }
        }
        return ans
    }
}

let s = Solution()
let r = s.fourSumCount([1, 2], [-2,-1], [-1, 2], [0, 2])
