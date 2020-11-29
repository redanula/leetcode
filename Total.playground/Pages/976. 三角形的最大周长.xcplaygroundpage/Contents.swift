/*
    关键：分组
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/

class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        let sa = Array(A).sorted()
        for i in (2..<sa.count).reversed() {
            if sa[i-2] + sa[i-1] > sa[i] {
                return sa[i-2] + sa[i-1] + sa[i]
            }
        }
        return 0
    }
}

let s = Solution()
let r = s.largestPerimeter([2,1,2])
