/*
    关键：
    时间复杂度：O(nlogn)
    空间复杂度：O(logn)
*/

class Solution {
    
    func sortedSquares(_ A: [Int]) -> [Int] {
        
        var ans = [Int]()
        ans = A.map {
            $0 * $0
        }
        return ans.sorted()
    }
}

let s = Solution()
let r = s.sortedSquares([-4,-1,0,3,10])
