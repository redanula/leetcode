/*
    First
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var ans = Array.init(repeating:0, count:A.count)
        var i = 0
        var j1 = 0
        var j2 = 1
        while i < A.count {
            if A[i] % 2 == 0 {
                ans[j1] = A[i]
                j1 += 2
            } else {
                ans[j2] = A[i]
                j2 += 2
            }
            i += 1
        }
        return ans
    }
}
