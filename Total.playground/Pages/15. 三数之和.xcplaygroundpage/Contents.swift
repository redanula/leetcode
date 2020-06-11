/*
    15. 三数之和
    First / Best
    关键：双指针
    时间复杂度：O(N2)
    空间复杂度：O(LogN)
*/

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    guard nums.count > 2 else {
        return []
    }
    
    let sortNums = nums.sorted()
    
    var ans = [[Int]]()
    for i in 0..<sortNums.count {
        
        // 去重复
        if i > 0 && sortNums[i] == sortNums[i-1] {
            continue
        }
        
        var right = sortNums.count - 1
        let target = -sortNums[i]
        
        for left in i+1..<sortNums.count {
            
            // 去重复
            if left > i+1 && sortNums[left] == sortNums[left-1] {
                continue
            }
            
            while left < right && sortNums[left] + sortNums[right] > target {
                right -= 1
            }
            
            if left == right {
                break;
            }
            
            if target == sortNums[left] + sortNums[right] {
                ans.append([sortNums[i],sortNums[left],sortNums[right]])
            }
        }
    }
    
    return ans
}

let r = threeSum([-1, 0, 1, 2, -1, -4])
let r2 = threeSum([0,0,0,0,0])
