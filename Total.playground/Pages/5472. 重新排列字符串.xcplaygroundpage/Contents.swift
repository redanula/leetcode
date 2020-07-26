/*
    First / Best
    关键：Hash
    时间复杂度：O(n)
    空间复杂度：O(n)
*/
class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        
        var map = [Int: Character]()
        let sa = Array(s)
        for i in 0..<indices.count {
            map[indices[i]] = sa[i]
        }
        var ans = ""
        for i in 0..<indices.count {
            ans.append(map[i]!)
        }
        
        return ans
    }

}

let s = Solution()
let r = s.restoreString("codeleet", [4,5,6,7,0,2,1,3])
