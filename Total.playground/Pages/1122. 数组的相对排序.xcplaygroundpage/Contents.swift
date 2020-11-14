/*
    First
    关键：
    时间复杂度：O(mlogm + n)
    空间复杂度：O(logm + n)
*/

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        
        var ans:[Int] = []
        var mapArr2 = [Int: Int]()
        
        for i in 0..<arr2.count {
            mapArr2[arr2[i]] = i
        }
        
        ans = arr1.sorted(by: { (v1, v2) -> Bool in
            if let m1 = mapArr2[v1], let m2 = mapArr2[v2] {
                return m1 <= m2
            } else if let _ = mapArr2[v1] {
                return true
            } else if let _ = mapArr2[v2] {
                return false
            } else {
                return v1 <= v2
            }
        })
        
        return ans
    }
}

let s = Solution()
let r = s.relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6])
