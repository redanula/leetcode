/*
    First
    关键：
    时间复杂度：O(26s)
    空间复杂度：O(26)
*/

class Solution {
    func sortString(_ s: String) -> String {
        
        var ans = String()
        var bucket = [Int](repeating: 0, count: 26)
        for item in s {
            bucket[Int(item.asciiValue!) - 97] += 1
        }
        
        while ans.count < s.count {
            for index in 0 ..< bucket.count {
                if bucket[index] > 0 {
                    bucket[index] -= 1
                    ans.append(Character(Unicode.Scalar(index + 97)!))
                }
            }
            for index in (0 ..< bucket.count).reversed() {
                if bucket[index] > 0 {
                    bucket[index] -= 1
                    ans.append(Character(Unicode.Scalar(index + 97)!))
                }
            }
        }
  
        return ans
    }
}


let s = Solution()
let r = s.sortString("aaabbbcccdd")
