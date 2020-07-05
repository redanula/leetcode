//: 5453. 所有蚂蚁掉下来前的最后一刻

class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        
        var ans = 0
        if let m = left.max() {
            ans = max(ans, m)
        }
        
        if let m = right.min() {
            ans = max(ans, n - m)
        }
        return ans
    }
}

let s = Solution()
let r = s.getLastMoment(7, [0,1,2,3,4,5,6,7], [])
//let r = s.getLastMoment(4, [4,3], [0,1])
