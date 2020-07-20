/*
    First / Best
    关键：双指针
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    func twoSumFirst(_ numbers: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<numbers.count {
            if let n1 = map[target - numbers[i]] {
                return [n1, i+1]
            } else {
                map[numbers[i]] = i + 1
            }
        }
        return []
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var low = 0
        var high = numbers.count-1
        while low < high {
            let sum = numbers[low] + numbers[high];
            if sum == target {
                return [low+1, high+1]
            } else if sum < target {
                low += 1
            } else {
                high -= 1
            }
        }
        return [-1,-1]
    }

}
let s = Solution()
let r = s.twoSum([1,2,3,4,5], 3)
let r2 = s.twoSum([1,2,3,4,10], 12)
