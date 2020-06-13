/*
    70. 爬楼梯
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(1)
*/


func climbStairs(_ n: Int) -> Int {
    
    guard n > 0 else {
        return 0
    }
    
    var last = (0, 0)
    for i in 1...n {
        if i == 1 {
            last.1 = i
        } else if i == 2 {
            last.0 = last.1
            last.1 = i
        } else {
            let tmp = last.0 + last.1
            last.0 = last.1
            last.1 = tmp
        }
    }
    return last.1
}

let r1 = climbStairs(1)
let r2 = climbStairs(2)
let r3 = climbStairs(3)
let r4 = climbStairs(4)
let r5 = climbStairs(0)
