/*
    350. 两个数组的交集 II
    First / Best
    关键：Hash
    时间复杂度：O(m+n)
    空间复杂度：O(min(m,n))
*/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        guard nums1.count > 0, nums2.count > 0 else {
            return []
        }
        
        var map = [Int: Int]()
        var ans = [Int]()
        
        for i in 0..<nums1.count {
            if let _ = map[nums1[i]] {
                map[nums1[i]]! += 1
            } else {
                map[nums1[i]] = 1
            }
        }
        
        for i in 0..<nums2.count {
            if let mItem = map[nums2[i]] {
                if mItem > 0 {
                    ans.append(nums2[i])
                    map[nums2[i]]! -= 1
                }
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.intersect([1,2,2,1], [2,2])
let r2 = s.intersect([4,9,5], [9,4,9,8,4])
let r3 = s.intersect([], [1])
