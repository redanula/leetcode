/*
    215. 数组中的第K个最大元素
    First / Best
    关键：快排改造
    时间复杂度：O(nlogn), 如果选tmp随机数快排可以降到O(n)
    空间复杂度：O(1ogn)
*/
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var left = 0, right = nums.count - 1
        while true {
            let mid = getMid(&nums, from: left, to: right, by: >=)
            if mid == k - 1 || right == left {
                return nums[k - 1]
            } else if mid < k - 1 && mid != -1 {
                left = mid + 1
            } else if mid > k - 1 {
                right = mid - 1
            }
        }
    }

    func getMid(_ nums: inout [Int], from: Int, to: Int, by method: (Int, Int) -> Bool) -> Int {
        guard from < to else { return -1 }
        var left = from, right = to, pivot = nums[from]
        while left < right {
            while left < right && method(pivot, nums[right]) { right -= 1 }
            nums[left] = nums[right]
            while left < right && method(nums[left], pivot) { left += 1 }
            nums[right] = nums[left]
        }
        nums[left] = pivot
        return left
    }
}

let s = Solution()
let r = s.findKthLargest([1], 1)
