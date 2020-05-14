/*
    136. 只出现一次的数字
    First / Bset
    关键：Hash \ 位运算
    时间复杂度：O(n)
    空间复杂度：Hash O(n)；位运算 O(1)

*/


func singleNumber_First(_ nums: [Int]) -> Int {
    
    var nMaps = [Int:Int]()
    for i in 0 ..< nums.count {
        if nMaps[nums[i]] == 1 {
            nMaps[nums[i]] = 2
        } else {
            nMaps[nums[i]] = 1
        }
    }
    
    for i in 0 ..< nums.count {
        if (nMaps[nums[i]] == 2) {
            continue
        }else {
            return nums[i]
        }
    }
    
    return -1
}

func singleNumber(_ nums: [Int]) -> Int {
    
    var r = 0
    for i in 0 ..< nums.count {
        r = r ^ nums[i]
    }
    return r
}

let r = singleNumber([1,2,3,2,1])
