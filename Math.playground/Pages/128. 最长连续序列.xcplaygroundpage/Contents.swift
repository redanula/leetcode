/*
    128. 最长连续序列
    First / Best
    关键：枚举
    时间复杂度：O(n)
    空间复杂度：O(n)
*/

func longestConsecutive(_ nums: [Int]) -> Int {
    var ans = 0
    var maps = [Int: Int]()
    guard nums.count > 0  else {
        return ans
    }

    for num in nums {
        maps[num] = 1
    }
    
    for i in 0..<nums.count {
        if maps[nums[i] - 1] == nil {
            var c = 1
            var num = nums[i]
            while let _ = maps[num + 1] {
                c += 1
                num += 1
            }
            ans = max(c, ans)
        }
    }
    return ans
}

let r = longestConsecutive([100, 4, 200, 1, 3, 2])
let r2 = longestConsecutive([1,2,3,4,5,10,9,7,6])
let r3 = longestConsecutive([1,2,0,1])
let r4 = longestConsecutive([1])
let r5 = longestConsecutive([1,1])
let r6 = longestConsecutive([1,0])
let r7 = longestConsecutive([1,0,2])
let r8 = longestConsecutive([2,0,1])
let r9 = longestConsecutive([])
let r10 = longestConsecutive([10,110,1])
let r11 = longestConsecutive([0,3,7,2,5,8,4,6,0,1])
