/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 0 else {
            return
        }

        var index = nums.count - 1
        // 找到A[i] > A[i - 1]
        while index > 0 {
            if nums[index] > nums[index - 1] {
                break
            }
            index -= 1
        }

        // 没找到位置，翻转整个数组
        if index == 0 {
            nums.reverse()
            return
        }
        
        // 这里需要前移
        index -= 1

        // 找到需要交换的位置
        var j = nums.count - 1
        while j > index {
            if nums[index] < nums[j] {
                break
            }
            j -= 1
        }

        nums.swapAt(index, j)
        index += 1
        // 降序
        nums = nums[0..<index] + nums[index..<nums.count].sorted(by: <)
    }
}
