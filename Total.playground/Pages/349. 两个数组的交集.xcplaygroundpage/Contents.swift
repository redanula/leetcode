/*
    First / Best
    关键：
    时间复杂度：O(m+n)
    空间复杂度：O(min(m,n))
*/

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        guard nums1.count > 0, nums2.count > 0 else {
            return []
        }
        
        var ans = [Int]()
        var minMap = [Int: Int]()
        
        let min1 = nums1.count > nums2.count ? nums2 : nums1
        let max1 = nums1.count > nums2.count ? nums1 : nums2
        
        for i in 0..<min1.count {
            minMap[min1[i]] = 1
        }
        
        for i in 0..<max1.count {
            if let m = minMap[max1[i]] {
                if m == 1 {
                    ans.append(max1[i])
                    minMap[max1[i]] = 0
                }
            }
        }
        
        return ans
        
    }
}

let s = Solution()
let r = s.intersection([4,9,5], [9,4,9,8,4])
