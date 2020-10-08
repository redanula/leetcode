/*
    关键：指针
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func reverseString(_ s: inout [Character]) {
        let n = s.count
        for i in 0..<n/2 {
            let tmp = s[i]
            s[i] = s[n-1-i]
            s[n-1-i] = tmp
        }
    }
}
