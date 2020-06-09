/*
    152. 乘积最大子数组
    First / Best
    关键：动态规划
    时间复杂度：O(n)
    空间复杂度：O(n)
*/


var mapMaxMin = [Int:[Int]]()

func maxProduct(_ nums: [Int]) -> Int {
    
    guard nums.count > 1 else { return nums.first ?? 0 }
    
    var result = Int.min
    var rMax = 1
    var rMin = 1
    
    for i in 0...nums.count-1 {
        if nums[i] < 0 {
           (rMin, rMax) = (rMax, rMin)
        }
        rMin = min(nums[i], nums[i] * rMin)
        rMax = max(nums[i], nums[i] * rMax)
        result = max(result, rMax)
    }
    
    return result
}

let nums = [2,3,-2,4]
let r = maxProduct(nums)
