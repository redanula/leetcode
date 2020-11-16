/*
    First
    关键：
    时间复杂度：O(n^2)
    空间复杂度：O(logn)
*/

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        
        guard people.count > 0 else {
            return []
        }
        
        guard people[0].count > 0 else {
            return []
        }
        
        
        var ans = [[Int]]()
        let sorted = people.sorted { (v1, v2) -> Bool in
            if v1[0] > v2[0] {
                return true
            } else if v1[0] == v2[0] {
                return v1[1] < v2[1]
            } else {
                return false
            }
        }
        
        for i in 0..<sorted.count {
            ans.insert(sorted[i], at: sorted[i][1])
//            print(sorted[i])
        }
        return ans
    }
}


let s = Solution()
let r = s.reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]])
