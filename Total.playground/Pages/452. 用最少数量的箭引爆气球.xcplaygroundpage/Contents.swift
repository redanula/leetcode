/*
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(nlogn)
*/

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        let sorted_points = points.sorted {
            return $0[1] < $1[1]
        }
        var pos = sorted_points[0][1]
        var ans = 1
        for p in sorted_points {
            if p[0] > pos {
                pos = p[1]
                ans += 1
            }
        }
        return ans
    }
}

let s = Solution()
let r = s.findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])
