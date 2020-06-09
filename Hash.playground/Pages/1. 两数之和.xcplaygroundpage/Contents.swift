/*
    1. 两数之和
    First / Best
    关键：Hash
    时间复杂度：O(n)
    空间复杂度：O(n)
*/


func twoSumBaoli(_ nums: [Int], _ target: Int) -> [Int] {

    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i,j]
            }
        }
    }

    return []
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map = [Int:Int]()
    
    for i in 0..<nums.count {
        if let v = map[target - nums[i]] {
            return [v, i]
        } else {
            map[nums[i]] = i
        }
    }
    
    return []
}

let r = twoSum([7, 11, 15, 2], 9)
let r2 = twoSum([1,2], 3)
