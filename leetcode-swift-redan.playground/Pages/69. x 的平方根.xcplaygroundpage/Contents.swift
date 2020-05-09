/*
    69. x 的平方根
    First / Best
    关键：二分查找
    时间复杂度：O(logx)
    空间复杂度：O(1)
*/
func mySqrt(_ x: Int) -> Int {
    
    var left = 0
    var right = x
    
    while left < right {
        let mid = (right + left) / 2 + 1
        if mid * mid > x {
            right = mid - 1
        }else {
            left = mid
        }
    }
    
    return left
}
//let r = mySqrt(10)
let r = mySqrt(2147395599)


