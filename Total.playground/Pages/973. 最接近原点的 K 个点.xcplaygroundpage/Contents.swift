/*
    First / Best
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(n)
*/

class Solution {
    
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        guard points.count > 0 else {
            return []
        }
        
        var ans = [[Int]]()
        var maps = [Int: [[Int]]]()
        var sArray = [Int]()
        let n = points.count
        
        for i in 0..<n {
            let s = points[i][0] * points[i][0] + points[i][1] * points[i][1]
            if let _ = maps[s] {
                maps[s]!.append(points[i])
                sArray.append(s)
            } else {
                maps[s] = [points[i]]
                sArray.append(s)
            }
        }
        
        sArray = sArray.sorted()
        
        var i = 0
        while i < K {
            ans.append(maps[sArray[i]]!.popLast()!)
            i += 1
        }
    
        return ans
    }
}

let s = Solution()
//let r = s.kClosest([[1,3],[-2,2]], 1)
let r2 = s.kClosest([[3,3],[5,-1],[-2,4]], 2)
