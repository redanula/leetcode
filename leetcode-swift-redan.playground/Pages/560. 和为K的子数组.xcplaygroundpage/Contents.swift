/*
    560. 和为K的子数组
    First / Bset
    关键：前缀和
    时间复杂度：O(n)
    空间复杂度：O(n)

*/

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var result = 0, preSum = 0
    var map: [Int: Int] = [0: 1]
    for i in 0 ..< nums.count {
        preSum += nums[i]
        if let num = map[preSum - k] {
            result += num
        }
        if let c = map[preSum] {
             map[preSum] = c + 1
        }
        else {
            map[preSum] = 1
        }
    }
    return result
}


let r = subarraySum([1,1,1],2)
