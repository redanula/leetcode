/*
    关键：指针
    时间复杂度：O(n)
    空间复杂度：O(1)
*/
class Solution {
    
    func moveZeroes(_ nums: inout [Int]) {
        
        var left = -1
        var right = -1
        var i = 0
        while i < nums.count {
            if nums[i] == 0 {
                // 记录left， right
                if left == -1 {
                    left = i
                }
                right = i
            } else {
                // 和left交换
                if left >= 0 {
                    nums[left] = nums[i]
                    nums[i] = 0
                    // 交换完成后，如果还有0
                    if right > left {
                        left += 1
                        right = i
                    } else {
                        left = i
                        right = i
                    }
//                    print(nums, i, left, right)
                }
                
            }
            
            i += 1
        }
    }
}

let s = Solution()
//var a = [0,1,0,3,12]
var a2 = [
    0,
    -955565449,
    0,
    -69843702,
    -461760848,
    1446130876
    ]
//s.moveZeroes(&a)
s.moveZeroes(&a2)
print(a2)
