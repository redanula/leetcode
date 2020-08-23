/*
    First / Best
    关键：公共前缀
    时间复杂度：O(logn)
    空间复杂度：O(1)
*/

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var num = n
        while m < num {
            num = num&(num-1)
        }
        return m&num
    }
}
