/*
    16. 最接近的三数之和
    First / Best
    关键：双指针
    时间复杂度：O(N2)
    空间复杂度：O(LogN)
*/

/*
    先排序
    假设:
    第一个数是nums[i] 标记为 a
    第二个数是nums[j] 标记为 b
    存在第三个数c , 使 |a + b + c - target| 最小
    则 如果 b1 > b , 下来的遍历的 c1 < c
    
    优化：相同的数不用重复遍历
         如果三数之和相等直接返回
 */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        guard nums.count > 2 else {
            return 0
        }
    
        var sum = 0
        // 1.先排序
        let sortNums = nums.sorted()
        var ans = sortNums[0] + nums[1] + sortNums[2]
        
        for i in 0..<sortNums.count {
            
            // 去重复
            if i > 0, sortNums[i] == sortNums[i-1] {
                continue
            }
            
            // 双指针
            var left = i+1
            var right = sortNums.count - 1
            while left < right {
                
                // 去重复
                if left > i + 1, sortNums[left] == sortNums[left-1] {
                    left += 1
                    continue
                }
                if right < sortNums.count - 1, sortNums[right] == sortNums[right + 1] {
                    right -= 1
                    continue
                }
                
                sum = sortNums[i] + sortNums[left] + sortNums[right]
                if target == sum {
                    return target
                } else {
                    ans = abs(sum - target) > abs(ans - target) ? ans : sum
                }
                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return ans
    }
}


let s = Solution()
let r = s.threeSumClosest([1,1,-1],2)
let r2 = s.threeSumClosest([-1,2,1,-4],2)
let r3 = s.threeSumClosest([1,1,1,1],-100)
