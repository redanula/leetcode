/*
    378. 有序矩阵中第K小的元素
    First / Best
    关键：二分查找
    时间复杂度：O(nlog(max - min))
    空间复杂度：O(1)
*/

class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        var left = matrix[0][0]
        var right = matrix[n-1][n-1]
        while left < right {
            let mid = left + (right - left) / 2
            if check(mid, n, k, matrix) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    func check(_ mid: Int, _ n: Int, _ k: Int, _ m:[[Int]]) -> Bool {
        
        var i = n - 1
        var j = 0;
        var num = 0;
        while i >= 0, j < n {
            if m[i][j] <= mid {
                num += i + 1
                j += 1
            } else {
                i -= 1
            }
        }
        return num >= k
    }
}




let s = Solution()
let r = s.kthSmallest([
                    [ 1,  5,  9],
                    [10, 11, 13],
                    [12, 13, 15]], 8)

