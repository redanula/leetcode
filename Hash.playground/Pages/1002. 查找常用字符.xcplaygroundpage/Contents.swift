/*
    关键：Hash
    时间复杂度：O(n*s)
    空间复杂度：O(max(s))

*/

class Solution {
    
    func commonChars(_ A: [String]) -> [String] {
        
        guard A.count > 0 else {
            return []
        }
        
        guard A[0].count > 0 else {
            return []
        }
        
        var ans = [String]()
        var maps = [Character: Int]()
        let first = Array(A[0])
        for i in 0..<first.count {
            if let _ = maps[first[i]] {
                maps[first[i]]! += 1
            } else {
                maps[first[i]] = 1
            }
        }
        
        for j in 1..<A.count {
            let sa = Array(A[j])
            var tmpMaps = [Character: Int]()
            for i in 0..<sa.count {
                if let c = maps[sa[i]], c > 0 {
                    if let _ = tmpMaps[sa[i]] {
                        tmpMaps[sa[i]]! += 1
                    } else {
                        tmpMaps[sa[i]] = 1
                    }
                    maps[sa[i]] = c - 1
                    if j == A.count - 1 {
                        ans.append(String(sa[i]))
                    }
                }
            }
            maps = tmpMaps
        }
        return ans
    }
}

let s = Solution()
let r = s.commonChars(["bella","label","roller"])
