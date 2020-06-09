/*
    238. 除自身以外数组的乘积
    First / Best
    关键：左右乘积
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var ans = Array.init(repeating: 1, count: nums.count)
    var R = 1
    let len = nums.count
    // 左乘积
    for i in 1..<len {
        ans[i] = ans[i-1] * nums[i-1]
    }
    
    // 右乘积
    for i in 0..<len {
        ans[len - i - 1] = ans[len - i - 1] * R
        R = R * nums[len - i - 1]
    }
    
    return ans
}

let r = productExceptSelf([1,2,3,4])
