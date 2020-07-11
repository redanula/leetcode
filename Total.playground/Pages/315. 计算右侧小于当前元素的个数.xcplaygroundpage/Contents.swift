/*
    315. 计算右侧小于当前元素的个数
    First / Best
    关键：归并排序
    时间复杂度：O(nlogn)
    空间复杂度：O(N)
*/
class Solution {
    var ans:[Int]!
    func countSmaller(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }

        ans = Array<Int>(repeating: 0, count: nums.count)
        var x: [(Int,Int)] = Array<(Int,Int)>(repeating: (0, 0), count: nums.count)
        for i in 0...nums.count-1 {
            x[i] = (i, nums[i])
        }
        var tempArr = Array<(Int,Int)>(repeating: (0, 0), count: x.count)
        mergeSort(&x, 0, nums.count-1, &tempArr)
        return ans
    }
    
    func mergeSort(_ nums: inout [(Int, Int)], _ begin:Int,_ end:Int, _ temp: inout [(Int, Int)]) {
        if begin < end {
            let middle = (begin + end) >> 1
            mergeSort(&nums, begin, middle, &temp)
            mergeSort(&nums, middle+1, end, &temp)
            mergePass(&nums, begin, middle, end, &temp)
        }
    }
    func mergePass(_ nums: inout [(Int,Int)], _ begin:Int, _ middle:Int, _ end:Int, _ tem:inout [(Int,Int)]) {
        var leftIndex = begin
        var rightIndex = middle+1
        var temIndex:Int = 0
        while leftIndex <= middle && rightIndex <= end {
            if nums[leftIndex].1 <= nums[rightIndex].1 {
                ans[nums[leftIndex].0] += rightIndex-middle-1
                tem[temIndex] = nums[leftIndex]
                temIndex += 1
                leftIndex = leftIndex+1
            } else {
                tem[temIndex] = nums[rightIndex]
                temIndex += 1
                rightIndex += 1
            }
        }
        while leftIndex <= middle {
            ans[nums[leftIndex].0] += rightIndex-middle-1
            tem[temIndex] = nums[leftIndex]
            temIndex += 1
            leftIndex += 1
        }
        while rightIndex <= end {
            tem[temIndex] = nums[rightIndex]
            temIndex += 1
            rightIndex += 1
        }
        
        for i in 0...end-begin {
            nums[begin+i] = tem[i]
        }
    }
}

let s = Solution()
let r = s.countSmaller([1,2,3,0,2])
