/*
    198. 打家劫舍
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

func robFirst(_ nums: [Int]) -> Int {
    var ans = 0
    var dp = [Int:Int]()
    for i in 0..<nums.count {
        if i == 0 {
            ans = nums[i]
            dp[i] = ans
            continue
        } else if i == 1 {
            ans = max(nums[i], ans)
            dp[i] = ans
            continue
        } else {
            ans = max(dp[i - 1]!, dp[i - 2]! + nums[i])
            dp[i] = ans
        }
        
    }
    return ans
}


func rob(_ nums: [Int]) -> Int {
    var ans1 = 0
    var ans2 = 0
    for i in 0..<nums.count {
        if i == 0 {
            ans1 = nums[i]
            ans2 = nums[i]
            continue
        } else if i == 1 {
            ans2 = max(nums[i], ans1)
            continue
        } else {
            let tmp = ans2
            ans2 = max(tmp, ans1 + nums[i])
            ans1 = tmp
        }
        
    }
    return ans2
}

let r = rob([1,2,3,1])
let r2 = rob([2,7,9,3,1])
let r3 = rob([])
let r4 = rob([1])
