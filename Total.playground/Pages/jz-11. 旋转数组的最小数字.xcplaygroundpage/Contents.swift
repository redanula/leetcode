/*
    First / Best
    关键：二分查找
    时间复杂度：O(logn)
    空间复杂度：O(1)
*/
class Solution {
    func minArrayFirst(_ numbers: [Int]) -> Int {

        guard numbers.count > 0 else {
            return -1
        }
        
        guard numbers.count > 1 else {
            return numbers[0]
        }
        
        for i in 0..<numbers.count-1 {
            if numbers[i] > numbers[i+1] {
                return numbers[i+1]
            }
        }
        
        return numbers[0]
    }
    
    func minArray(_ numbers: [Int]) -> Int {

        guard numbers.count > 0 else {
            return -1
        }
        
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            if numbers[mid] < numbers[right] {
                right = mid
            } else if numbers[mid] > numbers[right] {
                left = mid + 1
            } else {
                right -= 1
            }
        }
        
        return numbers[left]
    }
}

let s = Solution()
let r = s.minArray([3,4,5,1,2])
let r2 = s.minArray([2,2,2,0,1])
let r3 = s.minArray([2])
