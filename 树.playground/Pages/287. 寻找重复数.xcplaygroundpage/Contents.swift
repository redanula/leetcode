/*
    287. 寻找重复数
    Best
    关键：二分查找、放苹果
    时间复杂度：O(nlogn)
    空间复杂度：O(1)
*/


func findDuplicate(_ nums: [Int]) -> Int {
    
    guard nums.count > 1 else {
        return -1
    }
    
    let len = nums.count
    var left = 1, right = len - 1, ans = -1
    
    while left <= right {
        let mid = left + (right - left) / 2;
        var count = 0
        for i in 0..<len {
            if nums[i] <= mid {
                count += 1
            }
        }
        
        if count <= mid {
            left = mid + 1
        } else {
            right = mid - 1
            ans = mid
        }
    }
    
    return ans
}

let r = findDuplicate([1,3,4,2,2])
