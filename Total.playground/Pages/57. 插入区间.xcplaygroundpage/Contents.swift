/*
    First / Best
    关键：
    时间复杂度：O(n)
    空间复杂度：O(1)
*/

class Solution {
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        var ans = [[Int]]()
        var left = newInterval[0]
        var right = newInterval[1]
        var placed = false
        
        for i in intervals {
            
            if i[0] > right {
                if !placed {
                    ans.append([left, right])
                    placed = true
                }
                ans.append(i)
            } else if i[1] < left {
                ans.append(i)
            } else {
                left = min(left, i[0])
                right = max(right, i[1])
            }
        }
            
        if !placed {
            ans.append([left, right])
        }
        return ans
    }
    
}


let s = Solution()
let r = s.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
