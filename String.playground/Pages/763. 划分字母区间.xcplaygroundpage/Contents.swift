/*
    First
    关键：双指针
    时间复杂度：O(n)
    空间复杂度：O(26)
*/

class Solution {
    
    func partitionLabels(_ S: String) -> [Int] {
        
        guard S.count > 0 else {
            return []
        }
        
        var lastIndex = [Character: Int]()
        var start = 0
        var end = 0
        let sa = Array(S)
        var ans = [Int]()
        
        for i in 0..<sa.count {
            lastIndex[sa[i]] = i
        }
        
        for i in 0..<sa.count {
            end = max(end, lastIndex[sa[i]]!)
            if i == end {
                ans.append(end - start + 1)
                start = end + 1;
            }
        }
        
        return ans
    }
}

let s = Solution()
let r = s.partitionLabels("ababcbacadefegdehijhklij")
